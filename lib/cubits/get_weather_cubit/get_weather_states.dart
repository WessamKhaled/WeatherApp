import 'package:weather/models/weather_model.dart';

class WeatherStates{}

class WeatherInitialState extends WeatherStates{}

class WeatherLoadedState extends WeatherStates{
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates{
  final String errMessage;

  WeatherFailureState(this.errMessage);
}