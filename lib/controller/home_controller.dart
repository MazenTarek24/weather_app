import 'package:get/get.dart';
import 'package:weather_app/model/currentWeatherData.dart';
import 'package:weather_app/model/fiveDaysData.dart';

import '../service/weather_service.dart';

class HomeController extends GetxController
{
  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDaysData> fiveDaysData = [];

  HomeController({ required this.city});


  @override
  void onInit() {
    initState();
    super.onInit();
  }

  void initState() {
    getCurrentWeatherData();
    getiveDaysData();
  }

  void updateWeather() {
    initState();
  }

  void getCurrentWeatherData()
  {
    WeatherServices(
      city : '$city'
    ).getCurrentWeatherData(
      onSuccess:(data)=> {
        currentWeatherData = data,
        update()
      },
      onError: (error)=>{
        print(error.toString()),
        update()
      }
    );
  }
  void getTopFiveCities()
  {
    List<String> cities = [
      'zagazig',
      'cairo',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    cities.forEach((element) {
      WeatherServices(city: "$element").getCurrentWeatherData(
        onSuccess: (data) {
          dataList.add(data);
          update();
        },
        onError: (error){
        print(error.toString());
        update();
      });
    });
  }

  void getiveDaysData()
  {
    WeatherServices(city: "$city").getFiveDaysThreeHoursForcastData(
      onSuccess: (data){
        fiveDaysData = data;
        update();
      },
    onError: (error) {
      print(error.toString());
      update();
    }
    );
  }
}