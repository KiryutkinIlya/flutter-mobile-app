
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/appIcons.dart';
import 'package:my_app/block/weather/weather_block.dart';
import 'package:my_app/block/weather/weather_event.dart';
import 'package:my_app/block/weather/weather_state.dart';
import 'package:my_app/temp.dart';
import 'package:my_app/weather.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/widget/bottom_navigation.dart';

class WeatherPage extends StatelessWidget{
  const WeatherPage();

  @override
  Widget build(BuildContext context){
    return BlocProvider<WeatherBloc>(create: (context)=>WeatherBloc()..add(LoadWeatherEvent()),
    child:WeatherPageFlow());
  }
}

class WeatherPageFlow extends StatefulWidget {
  WeatherPageFlow({super.key,});
  @override
  _WeatherPageFlowState createState() => _WeatherPageFlowState();
}

class _WeatherPageFlowState extends State<WeatherPageFlow> {
  late Future<WeatherData> weatherDataFuture;
  late ScrollController _scrollController;
  final double scrollOffset = 500;
  double _opacityDuration = 0.0;
  var connectivityResult = ConnectivityResult.none; // Изначально нет соединения

  _scrollListener() {
    if (_scrollController.offset > 140) {
      if (this.mounted) {
        setState(() {
          _opacityDuration = 1.0;
        });
      }
    }
    if (_scrollController.offset <= scrollOffset) {
      if (this.mounted) {
        setState(() {
          _opacityDuration = 0 + _scrollController.offset / scrollOffset;
        });
      }
    }
  }

  Future<void> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      connectivityResult = result;
    });
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }
    weatherDataFuture = fetchData();
  }
  Future<WeatherData> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://yandex.com/time/sync.json?geo=49'));
      if (response.statusCode == 200) {
        return WeatherData.fromJson(json.decode(response.body));
      } else {
        throw Exception('Ошибка при запросе: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Ошибка: Нет подключения к интернету или другая проблема с сетью.');
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    checkConnectivity();
    weatherDataFuture = fetchData();
  }
  @override
  void dispose() {
    super.dispose();
  }
  Color _getColorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
      // Нет интернета, отображаем виджет "нет интернета"
      return BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: FutureBuilder<WeatherData>(
              future: weatherDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Возвращаем текст ошибки, если произошла ошибка
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  // Возвращаем интерфейс с данными о погоде
                  final weatherData = snapshot.data!;
                  return NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (context, innerBoxIsScrolled) =>
                    [
                      SliverAppBar(
                        title: TittleAppBar(
                          tempText: 'Погода в Пензе ${weatherData!
                              .temperature != null
                              ? weatherData!.temperature
                              : ''}℃',
                          opacity: _opacityDuration,
                        ),
                        floating: true,
                        pinned: true,
                        expandedHeight: 500,
                        backgroundColor:
                        _getColorFromHex(weatherData.skyColor),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            decoration: BoxDecoration(
                              color:
                              _getColorFromHex(weatherData!.skyColor),
                            ),
                          ),
                          title: Text(
                            '${weatherData!.temperature != null ? weatherData!
                                .temperature : ''}℃',
                          ),
                          centerTitle: true,
                          titlePadding: EdgeInsets.only(bottom: 250.0),
                        ),
                      ),
                    ],
                    body: Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Content(
                        timeSunrise: weatherData!.sunriseTime,
                        timeSunset: weatherData!.sunsetTime,
                      ),),
                  );
                }
              },
            ),
            bottomNavigationBar: BottomNavigation(index: 0),
          );
        },
      );
  }
}

class WidgetAppBar extends StatefulWidget {
  final String tempText;

  @override
  _WidgetAppBarState createState() => _WidgetAppBarState();

  WidgetAppBar( {required this.tempText});
}

class _WidgetAppBarState extends State<WidgetAppBar> {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black87,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Text(widget.tempText),
    );
  }
}

class TittleAppBar extends StatelessWidget {
  final String tempText;
  final double opacity;

  TittleAppBar( {required this.tempText, required this.opacity, });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(34),
      child: Center(
          child:Opacity(
            opacity:opacity,
            child:Text(tempText),
          )
      ),);
  }
}
class Content extends StatelessWidget {
  final String timeSunset;
  final String timeSunrise;
  Content({
    required this.timeSunrise,
    required this.timeSunset,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin:EdgeInsets.only(top:50),
      child:SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetTemp(tempText: timeSunrise, icon: Icon(AppIcons.sunrise),),
              WidgetTemp(tempText: '2', icon: Icon(AppIcons.sunDay),),
              WidgetTemp(tempText: timeSunset,icon: Icon(AppIcons.sunset),),
            ],
          )
          ],),),);
  }
}