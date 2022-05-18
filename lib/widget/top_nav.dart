import 'package:flutter/material.dart';
import 'package:simba_todo/widget/custom_text.dart';
import 'package:simba_todo/widget/responsive.dart';
import 'package:simba_todo/widget/style.dart';

AppBar topNavigationBar(
  BuildContext context,
) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: const Icon(Icons.list_alt,
                      size: 14, color: Colors.pinkAccent),
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
      elevation: 0,
      title: Row(
        children: [
          Visibility(
            visible: !ResponsiveWidget.isSmallScreen(context),
            child: CustomText(
              text: '3rigx TODO ',
              color: lightGrey,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          const SizedBox(
            width: 24,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: const [
                  CustomText(text: 'Add New'),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.add_box)
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: active.withOpacity(.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                child: Icon(
                  Icons.person_outline,
                  color: light,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: secondaryColor,
    );
