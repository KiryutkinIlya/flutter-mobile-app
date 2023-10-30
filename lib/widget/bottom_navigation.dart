import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, required this.index});
  final int index;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.sunny,),
          label: 'Погода',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time_rounded),
          label: 'Статистика',
        ),
      ],
      currentIndex: widget.index,
      selectedItemColor: Colors.amber[800],
      onTap:  (index)=>_onItemTapped(context,index),
    );
  }
  void _onItemTapped(BuildContext context, int index) {
    switch(index)
    {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context,'/weatherPage' ,(route) => false);
        break;
      case 1:
        Navigator.of(context).pushNamed('/listPage' ,arguments: {'tittle': 'из нижний панели'});
        break;
    }
  }
}