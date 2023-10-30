import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/models/weather.dart';

class WeatherGateway{
  WeatherGateway();
  Future<WeatherResponse> getWeather()async{
    final response = await http.get(Uri.parse('https://yandex.com/time/sync.json?geo=49'));
    return WeatherResponse.fromJson(json.decode(response.body));
  }
}