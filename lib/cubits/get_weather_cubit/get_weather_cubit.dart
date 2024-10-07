import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_model.dart';

import '../../services/weather_services.dart';
import '../../views/search_view.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String city}) async{
    try{
      weatherModel= await WeatherServices(Dio())
          .getCurrentWeather(city: city);
      emit(WeatherLoadedState(weatherModel: weatherModel! ));
    }catch(e){
      emit(WeatherFailureState(e.toString()));
    }



  }

}