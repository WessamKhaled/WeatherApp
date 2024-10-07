import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices{
  WeatherServices(this.dio);
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "d91f75cd7a5b4e49af4150704240210";

  Future<WeatherModel> getCurrentWeather({required String city}) async{
    try{
      Response response = await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$city&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    }on DioException catch(e){
      final String errorMessage = e.response?.data["error"]["message"] ?? "oops there was an error, try later";
      throw Exception(errorMessage);
    }catch(e){
      log(e.toString());
      throw Exception("oops there was an error, try later");
    }

  }

  Future<WeatherModel> getForecast({required String city}) async{
      Response response = await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$city&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
  }
}

