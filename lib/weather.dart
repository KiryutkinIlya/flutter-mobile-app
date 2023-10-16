class WeatherData {
  final int time;
  final String cityName;
  final int temperature;
  final String sunriseTime;
  final String sunsetTime;
  final String skyColor;
  WeatherData({
    required this.time,
    required this.cityName,
    required this.temperature,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.skyColor,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      time: json['time'],
      cityName: json['clocks']['49']['name'],
      temperature: json['clocks']['49']['weather']['temp'],
      sunriseTime: json['clocks']['49']['sunrise'],
      sunsetTime: json['clocks']['49']['sunset'],
      skyColor: json['clocks']['49']['skyColor'],
    );
  }
}