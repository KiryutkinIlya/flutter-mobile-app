
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widget/bottom_navigation.dart';
import 'PageHorizontal/list_page_h.dart';
import 'PageVertical/list_page_v.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key
  });

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait ?
              MyHomeVerticalPage(title: 'r') : MyHomeHorizontalPage(
                title:'4');
            }),
    bottomNavigationBar: BottomNavigation(index:1),);
  }
}
