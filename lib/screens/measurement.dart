import 'package:flutter/material.dart';

class Measurement extends StatelessWidget {
  static const String routeName = 'measurement_screen';
  const Measurement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measurement'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('welcome to measurement screen'),
      ),
    );
  }
}
