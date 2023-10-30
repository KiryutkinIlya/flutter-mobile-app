// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// SerdesJsonGenerator
// **************************************************************************

class WeatherResponse {
  final WeatherResponseScheme? $scheme = null;

  final int time;
  final String tim;

  WeatherResponse({
    required this.time,
    required this.tim,
  });

  WeatherResponse.fromJson(Map<String, dynamic> json)
      : time = getJsonValue<int>(json, 'time'),
        tim = getJsonValue<String>(json, 'tim') {}

  static WeatherResponse fromStringJson(String json) =>
      WeatherResponse.fromJson(jsonDecode(json) as Map<String, dynamic>);

  Map<String, dynamic> toJson() {
    final $result = <String, dynamic>{};

    $result['time'] = time;
    $result['tim'] = tim;

    return $result;
  }

  String toStringJson() => jsonEncode(toJson());
}
