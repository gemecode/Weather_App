import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  String? weatherConditionTheme;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      weatherConditionTheme = weatherModel!.weatherCondition;
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      weatherConditionTheme = null;
      emit(WeatherFailureState(error: e.toString()));
    }
  }
}
