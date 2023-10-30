
import 'package:equatable/equatable.dart';
import 'package:my_app/block/weather/weather_event.dart';

abstract class WeatherState extends Equatable{}

class LoadingWeatherState extends WeatherState{
  @override
  List<Object?> get props =>[];
}