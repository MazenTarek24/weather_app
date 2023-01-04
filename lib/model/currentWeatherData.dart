import 'dart:convert';

import 'package:weather_app/model/sys.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/wind.dart';

import 'clouds.dart';
import 'coord.dart';
import 'main.dart';

class CurrentWeatherData
{
  final  Cord? cord;
  final  List<Weather>? weather;
  final MainWeather? main;
  final  Wind? wind;
  final  Cloud? cloud;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final String? base;
  final int? cod;
  final int? dt;

  CurrentWeatherData(
  {
    this.cord,
    this.weather,
    this.main,
    this.wind,
    this.cloud,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.base,
    this.cod,
    this.dt
});

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherData(
      cord: Cord.fromJson(json["cord"]),
      weather: (json["weather"] as List)
          .map((i) =>  Weather.fromJson(i) /* can't generate it properly yet */)
          .toList(),
      main: MainWeather.fromJson(json["main"]),
      wind: Wind.fromJson(json["wind"]),
      cloud: Cloud.fromJson(json["cloud"]),
      sys: Sys.fromJson(json["sys"]),
      timezone: int.parse(json["timezone"]),
      id: int.parse(json["id"]),
      name: json["name"],
      base: json["base"],
      cod: int.parse(json["cod"]),
      dt: int.parse(json["dt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cord": this.cord,
      "weather": jsonEncode(this.weather),
      "main": this.main,
      "wind": this.wind,
      "cloud": this.cloud,
      "sys": this.sys,
      "timezone": this.timezone,
      "id": this.id,
      "name": this.name,
      "base": this.base,
      "cod": this.cod,
      "dt": this.dt,
    };
  }

//

}