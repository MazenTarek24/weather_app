class MainWeather{

  double? temp , feels_like, tempMin, tempMax;
  int?  pressure,humidity;

  MainWeather({
    this.temp, this.feels_like, this.tempMin, this.tempMax, this.pressure,
    this.humidity
});

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: double.parse(json["temp"]),
      feels_like: json["feels_like"],
      tempMin: json["temp_min"],
      tempMax: json["temp_max"],
      pressure: int.parse(json["pressure"]),
      humidity: json["humidity"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": this.temp,
      "feels_like": this.feels_like,
      "temp_min": this.tempMin,
      "temp_max": this.tempMax,
      "pressure": this.pressure,
      "humidity": this.humidity,
    };
  }

//

}