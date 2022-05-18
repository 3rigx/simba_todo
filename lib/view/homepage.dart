import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simba_todo/widget/cards_large.dart';
import 'package:simba_todo/widget/cards_medium.dart';
import 'package:simba_todo/widget/cards_small.dart';
import 'package:simba_todo/widget/cardscroll.dart';
import 'package:simba_todo/widget/cardtile.dart';
import 'package:simba_todo/widget/responsive.dart';
import 'package:simba_todo/widget/style.dart';

var totlng = 5;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = totlng - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: totlng - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return Column(
      children: [
        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                const CardsMedium()
              else
                const CardsLarge()
            else
              const CardSmall(),
            const SizedBox(
              height: 15,
            ),
            CardScrollWidget(1, totlng),

            const SizedBox(
              height: 15,
            ),

            //table starts
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.only(
                bottom: 30,
              ),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 6),
                    color: lightGrey.withOpacity(.1),
                    blurRadius: 12,
                  ),
                ],
                border: Border.all(
                  color: lightGrey,
                  width: .5,
                ),
              ),
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream:
                      FirebaseFirestore.instance.collection("Todo").snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Something went Wrong, Check Data Connecton',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'No Task Todo',
                              ),
                            ],
                          ),
                        );
                      }
                      var data = snapshot.data!.docs;

                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.size,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {}, //TODO:: create a snackbar
                              child: TaskTile(
                                  data[index]['color'],
                                  data[index]['endTime'],
                                  data[index]['isCompleted'],
                                  data[index]['note'],
                                  data[index]['startTime'],
                                  data[index]['title']),
                            );
                          });
                    }
                  }),
            ),
            //table ends
          ],
        ))
      ],
    );
  }
}
