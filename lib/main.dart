import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_views.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>  BlocBuilder<GetWeatherCubit,WeatherStates>(
          builder:(context, state) =>  MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemeColor(BlocProvider
                  .of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherCondition,),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          ),
        ),
      ),
    );
  }}


  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.grey;
    }
    switch (condition) {
      case "Sunny":
        return Colors.orange; // MaterialColor
      case "Partly cloudy" :
      case "Cloudy":
      case "Overcast":
        return Colors.grey; // MaterialColor

      case "Mist" :
      case "Fog":
        return Colors.blueGrey; // MaterialColor

      case "Patchy rain" :
      case "Light rain":
      case "Moderate rain" :
        return Colors.lightBlue; // MaterialColor

      case "Heavy rain" :
      case "Torrential rain":
        return Colors.blue; // MaterialColor

      case "Patchy snow" :
      case "Light snow":
        return Colors.cyan; // MaterialColor

      case "Moderate snow" :
      case "Heavy snow":
        return Colors.indigo; // MaterialColor

      case "Sleet" :
      case "Freezing drizzle":
      case "Freezing rain" :
        return Colors.blue; // MaterialColor

      case "Thundery" :
      case "Thunder":
        return Colors.deepPurple; // MaterialColor
      case "Ice pellets":
        return Colors.teal; // MaterialColor
      default:
        return Colors.grey; // Default MaterialColor
    }
  }




