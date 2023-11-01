import 'package:flutter/material.dart';

class CustomException extends StatelessWidget {
  const CustomException({super.key, required this.exception});
  final String exception;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
          child: Text(
        '$exception 😞 ',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      )),
    );
  }
}
