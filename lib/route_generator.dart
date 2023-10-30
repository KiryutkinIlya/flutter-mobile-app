import 'package:flutter/material.dart';
import 'basePage/list_page.dart';
import 'basePage/weather_pade.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    WidgetBuilder? builder;
    switch (settings.name) {
      case '/listPage':
        builder = (BuildContext context) => ListPage();
        break;
      case '/weatherPage':
        builder = (BuildContext context) => WeatherPageFlow();
        break;
      default:
        return _errorRoute();
    }
    return FadePadeRoute(builder: builder, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class FadePadeRoute extends MaterialPageRoute{
  FadePadeRoute(
      {required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}