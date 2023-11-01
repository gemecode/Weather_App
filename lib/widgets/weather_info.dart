import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherModel.cityName,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          'updated at ${DateFormat('hh:mm a').format(weatherModel.date)}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              'https:${weatherModel.image}',
              width: 90,
              height: 90,
            ),
            Text(
              weatherModel.temp.round().toString(),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text(
                  'maxTemp: ${weatherModel.maxTemp.round().toString()}',
                  style: const TextStyle(fontSize: 13),
                ),
                Text(
                  'minTemp: ${weatherModel.minTemp.round().toString()}',
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          weatherModel.weatherCondition,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
