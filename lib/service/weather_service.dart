import 'package:weather_app/model/currentWeatherData.dart';
import 'package:weather_app/model/fiveDaysData.dart';

import '../api/api_repo.dart';

class WeatherServices{
  final String? city;
//https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=4d87bbf7ac4b11d57be0cdfee1d3f2c2
  String? baseUrl ="https://api.openweathermap.org/data/2.5";
  String? apiKey = "appid=4d87bbf7ac4b11d57be0cdfee1d3f2c2";

  WeatherServices({this.city});

  void getCurrentWeatherData({
  Function()? beforeSend,
  Function(CurrentWeatherData currentWeatherData)? onSuccess,
  Function(dynamic error)? onError,
})
  {
    final url = "$baseUrl/weather?q=$city&lang=en&$apiKey";
    WeatherRepo(
      url: url,
    ).get(
      beforeSend: ()=>
      {
        if(beforeSend != null){
          beforeSend
        },
      },
      onSuccess: (data) =>
      {
        if(onSuccess != null)
          {
            onSuccess(CurrentWeatherData.fromJson(data))
          },
      },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }
  void getFiveDaysThreeHoursForcastData({
    Function()? beforeSend,
    Function(List<FiveDaysData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  })
  {
    final url = "$baseUrl/weather?q=$city&lang=en&$apiKey";
    WeatherRepo(
      url: url,
    ).get(
        beforeSend: ()=>
        {},
        onSuccess: (data) =>
        {
          if(onSuccess != null)
            {
              onSuccess((data['list'] as List).map((e)
              => FiveDaysData.fromJson(e)).toList())
            },
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }
  }