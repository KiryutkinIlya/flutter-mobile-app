
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/PageHorizontal/list_page_h.dart';
import 'package:my_app/PageVertical/list_page_v.dart';
import 'package:my_app/widget/bottom_navigation.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title
  });

  final String title;

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
              MyHomeVerticalPage(title: widget.title,) : MyHomeHorizontalPage(
                title: widget.title,);
            }),
    bottomNavigationBar: BottomNavigation(index:0),);
  }
}
