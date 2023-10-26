import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widget/item_widget.dart';

class MyHomeVerticalPage extends StatefulWidget {
  const MyHomeVerticalPage({super.key, required this.title});

  final String title;

  @override
  State<MyHomeVerticalPage> createState() => _MyHomeVerticalPageState();
}

class _MyHomeVerticalPageState extends State<MyHomeVerticalPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 1,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Center(
                          child: Text(' ${widget.title} ${(index + 1).toString()} ',
                          ),
                        ));
                  },
                  itemCount: _count > 0 ? _count : 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      _count++;
                      setState(() {});
                    },
                    icon: Icon(Icons.plus_one)),
                IconButton(
                    onPressed: () {
                      if (_count > 1) _count--;
                      setState(() {});
                    },
                    icon: Icon(Icons.exposure_minus_1)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
