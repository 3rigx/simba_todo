import 'package:flutter/material.dart';
import 'package:simba_todo/widget/infocard.dart';
import 'package:simba_todo/widget/style.dart';

class CardsLarge extends StatelessWidget {
  const CardsLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: 1,
      ),
      children: const [
        Infocad(
          title: '12 Task',
          subtitle: 'Completed',
          color: Colors.green,
          icon: Icons.add_task_sharp,
        ),
        Infocad(
          title: '4 Task',
          subtitle: 'In Progress',
          color: Colors.blue,
          icon: Icons.add_task_sharp,
        ),
        Infocad(
          title: 'Task due',
          subtitle: 'Task Due',
          color: Colors.red,
          icon: Icons.add_task_sharp,
        ),
      ],
    );
  }
}
