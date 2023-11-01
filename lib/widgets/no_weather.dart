import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'there is no weather 😞 start \n searching now 🔍',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25),
    ));
  }
}
