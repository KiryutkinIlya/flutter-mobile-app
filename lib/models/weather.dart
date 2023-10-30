import 'package:serdes_json/serdes_json.dart';

part 'weather.g.dart';

@SerdesJson()
class WeatherResponseScheme
{
  late int time;
  late String tim;
}