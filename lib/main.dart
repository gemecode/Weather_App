import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherConditionTheme),
                ),
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherConditionTheme),
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  // Define a map to associate weather conditions with colors.
  final conditionColors = {
    'Sunny': Colors.orange,
    'Partly cloudy': Colors.blue,
    'Cloudy': Colors.grey,
    'Overcast': Colors.grey,
    'Mist': Colors.grey,
    'Patchy rain possible': Colors.blue,
    'Patchy snow possible': Colors.grey,
    'Patchy sleet possible': Colors.grey,
    'Patchy freezing drizzle possible': Colors.grey,
    'Thundery outbreaks possible': Colors.yellow,
    'Blowing snow': Colors.grey,
    'Blizzard': Colors.grey,
    'Fog': Colors.grey,
    'Freezing fog': Colors.grey,
    'Patchy light drizzle': Colors.blue,
    'Light drizzle': Colors.blue,
    'Freezing drizzle': Colors.grey,
    'Heavy freezing drizzle': Colors.grey,
    'Patchy light rain': Colors.blue,
    'Light rain': Colors.blue,
    'Moderate rain at times': Colors.blue,
    'Moderate rain': Colors.blue,
    'Heavy rain at times': Colors.blue,
    'Heavy rain': Colors.blue,
    'Light freezing rain': Colors.grey,
    'Moderate or heavy freezing rain': Colors.grey,
    'Light sleet': Colors.grey,
    'Moderate or heavy sleet': Colors.grey,
    'Patchy light snow': Colors.grey,
    'Light snow': Colors.grey,
    'Patchy moderate snow': Colors.grey,
    'Moderate snow': Colors.grey,
    'Patchy heavy snow': Colors.grey,
    'Heavy snow': Colors.grey,
    'Ice pellets': Colors.grey,
    'Light rain shower': Colors.blue,
    'Moderate or heavy rain shower': Colors.blue,
    'Torrential rain shower': Colors.blue,
    'Light sleet showers': Colors.grey,
    'Moderate or heavy sleet showers': Colors.grey,
    'Light snow showers': Colors.grey,
    'Moderate or heavy snow showers': Colors.grey,
    'Light showers of ice pellets': Colors.grey,
    'Moderate or heavy showers of ice pellets': Colors.grey,
    'Patchy light rain with thunder': Colors.blue,
    'Moderate or heavy rain with thunder': Colors.blue,
    'Patchy light snow with thunder': Colors.grey,
    'Moderate or heavy snow with thunder': Colors.grey,
  };

  // Look up the color for the given condition.
  return conditionColors[condition] ?? Colors.grey;
}
