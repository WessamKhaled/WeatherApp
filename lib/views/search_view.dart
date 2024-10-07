import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Search",

        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),

          child: TextField(
            onSubmitted: (value) async{
             // WeatherModel weatherModel= await WeatherServices(Dio().getCurrentWeather(city: value);
              // log(weatherModel.cityName);
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(city: value);
              Navigator.pop(context);
            },
            
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              labelText: "Search",
              suffixIcon: Icon(Icons.search),
              hintText: "Enter City Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              
            ),
          ),

      ),
    );
  }
}

