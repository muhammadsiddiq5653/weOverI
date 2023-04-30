class Weather {
  final String location;
  final String status;
  final double tempF;
  final String icon;

  Weather(
      {required this.location,
      required this.status,
      required this.tempF,
      required this.icon});

  factory Weather.fromJson(dynamic json) {
    return Weather(
      location: json['location']['name'],
      tempF: json['current']['temp_f'],
      status: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
    );
  }
}
