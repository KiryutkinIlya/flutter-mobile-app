import 'package:flutter/material.dart';
import 'package:my_app/route_generator.dart';
import 'basePage/list_page.dart';
import 'basePage/login_page.dart';
//https://yandex.com/time/sync.json?geo=49
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дневник погоды',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
