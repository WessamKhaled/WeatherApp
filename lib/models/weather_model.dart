class WeatherModel{
  final String cityName;
  final DateTime date;
  final String? image;
  final double Temp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.Temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherCondition,

  });

  factory WeatherModel.fromJson(json){
    return WeatherModel(
        cityName: json["location"]["name"],
        date: DateTime.parse(json["current"]["last_updated"]),
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        Temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }

}