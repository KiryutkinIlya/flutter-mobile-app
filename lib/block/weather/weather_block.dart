

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/block/weather/weather_event.dart';
import 'package:my_app/block/weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  WeatherBloc():super(LoadingWeatherState()){
    on <LoadWeatherEvent>((event,emit)=> _loadWeather(event,emit));
  }
  _loadWeather(LoadWeatherEvent event,Emitter<WeatherState> emit) async{
    emit(LoadingWeatherState());
  }

}