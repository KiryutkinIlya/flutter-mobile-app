
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appIcons.dart';

class WidgetTemp extends StatefulWidget {
  final String tempText;
  final Icon icon;
  @override
  _WidgetTempState createState() => _WidgetTempState();

  WidgetTemp({required this.tempText, required this.icon});
}

class _WidgetTempState extends State<WidgetTemp> {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey, // Цвет тени// Смещение тени по горизонтали и вертикали
            blurRadius: 5, // Радиус размытия тени
            spreadRadius: 2, // Радиус распространения тени
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child:Column(
      children:
      [
        widget.icon,
        Text(widget.tempText, style: TextStyle(
        color: Colors.black,
        // Другие свойства стиля текста, если необходимо
      ),),]
    ),);
  }
}