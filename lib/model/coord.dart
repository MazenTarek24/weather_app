class Cord{
  double? lon;
  double? lat;

  Cord({
  this.lon, this.lat
  });

  factory Cord.fromJson(Map<String, dynamic> json) {
    return Cord(
      lon: double.parse(json["lon"]),
      lat: double.parse(json["lat"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lon": this.lon,
      "lat": this.lat,
    };
  }

}