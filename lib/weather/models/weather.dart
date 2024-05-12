import 'package:weather/weather/repositories/weather_repository.dart';

sealed class Weather {
  Weather({
    this.maxTemperature,
    this.minTemperature,
    this.location,
  });

  String? location;
  List<double>? maxTemperature;
  List<double>? minTemperature;
}

class DailyWeather extends Weather {
  DailyWeather({
    required this.days,
    required super.minTemperature,
    required super.maxTemperature,
    required this.precipitationHours,
    required this.precipitationSums,
    required this.weatherType,
  });

  factory DailyWeather.fromJson(
    Map<String, dynamic> json,
    List<WeatherType> weatherType,
  ) {
    return DailyWeather(
      days: (json["time"] as List).map((e) => (DateTime.parse(e))).toList(),
      weatherType: weatherType,
      maxTemperature:
          (json["temperature_2m_max"] as List).map((e) => e as double).toList(),
      minTemperature:
          (json["temperature_2m_min"] as List).map((e) => e as double).toList(),
      precipitationHours: (json["precipitation_hours"] as List)
          .map((e) => e as double)
          .toList(),
      precipitationSums:
          (json["precipitation_sum"] as List).map((e) => e as double).toList(),
    );
  }

  final List<WeatherType> weatherType;
  final List<double> precipitationHours;
  final List<double> precipitationSums;
  final List<DateTime> days;
}

class CurrentWeather extends Weather {
  CurrentWeather({
    required super.location,
    required this.cloudCover,
    required this.temperature,
    required this.windSpeed,
    required this.relativeHumidity,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json, String location) {
    return CurrentWeather(
        location: location,
        cloudCover: json["cloud_cover"],
        temperature: json["temperature_2m"],
        windSpeed: json["wind_speed_10m"],
        relativeHumidity: json["relative_humidity_2m"]);
  }
  final double temperature;
  final double windSpeed;
  final int relativeHumidity;
  final int cloudCover;
}
// class HourlyWeather extends Weather {
//   HourlyWeather({
//     required this.hours,
//     required this.temperatures,
//   });

//   factory HourlyWeather.fromJson(Map<String, dynamic> json) {
//     return HourlyWeather(
//       hours: json["hours"],
//       temperatures: json["temperatures"],
//     );
//   }
//   final List<DateTime> hours;
//   final List<double> temperatures;
// }
