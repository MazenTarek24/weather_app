class Wind{
  double? speed;
  int? deg;


  Wind({
    this.speed, this.deg
});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: double.parse(json["speed"]),
      deg: int.parse(json["deg"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "speed": this.speed,
      "deg": this.deg,
    };
  }


//

}