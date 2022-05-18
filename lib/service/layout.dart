import 'package:flutter/material.dart';
import 'package:simba_todo/view/homepage.dart';
import 'package:simba_todo/widget/responsive.dart';
import 'package:simba_todo/widget/top_nav.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: topNavigationBar(context),
        body: const ResponsiveWidget(
            largeScreen: HomePage(),
            smallScreen: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: HomePage(),
            )));
  }
}
