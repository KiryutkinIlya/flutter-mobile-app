import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomeHorizontalPage extends StatefulWidget {
  const MyHomeHorizontalPage({super.key, required this.title});

  final String title;

  @override
  State<MyHomeHorizontalPage> createState() => _MyHomeHorizontalPageState();
}

class _MyHomeHorizontalPageState extends State<MyHomeHorizontalPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return new Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Center(
                          child: Text(' ${widget.title} ${(index + 1).toString()} ',
                          ),
                        ));
                  },
                  itemCount: _count > 0 ? _count : 1),
            ),
            Column(
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
