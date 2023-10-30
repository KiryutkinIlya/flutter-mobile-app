
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable{}

class LoadWeatherEvent extends WeatherEvent{
  @override
  List<Object?> get props =>[];
}