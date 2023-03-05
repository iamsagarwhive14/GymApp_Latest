import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_Screen';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2d5d7b),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(image: AssetImage('assets/images/image 11.png')),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Text(
              'Welcome To Gym App',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            )),
          )
        ],
      )),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var gymId = prefs.getString('gymId');

    if (token != null && gymId != null) {
      Navigator.pushReplacementNamed(context, RouteName.homeScreen);
    } else if (gymId != null) {
      Navigator.pushReplacementNamed(context, RouteName.loginScreen);
    } else {
      Navigator.pushReplacementNamed(context, RouteName.welcomeScreen);
    }
  }
}
