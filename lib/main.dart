import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/login_provider.dart';
import 'package:gym_mgmtsystem/providers/measurement_provider.dart';
import 'package:gym_mgmtsystem/providers/payment_provider.dart';
import 'package:gym_mgmtsystem/screens/home_screen.dart';
import 'package:gym_mgmtsystem/screens/login_screen.dart';
import 'package:gym_mgmtsystem/screens/measurement.dart';
import 'package:gym_mgmtsystem/screens/payment_history.dart';
import 'package:gym_mgmtsystem/screens/product.dart';
import 'package:gym_mgmtsystem/screens/profile.dart';
import 'package:gym_mgmtsystem/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvide(),
      ),
      ChangeNotifierProvider(
        create: (context) => PaymentHistoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MeasurementProvider(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        PaymentHistory.routeName: (context) => const PaymentHistory(),
        MeasurementScreen.routeName: (context) => const MeasurementScreen(),
        Product.routeName: (context) => const Product(),
        Profile.routeName: (context) => const Profile(),
        SplashScreen.routeName: (context) => const SplashScreen(),
      },
    );
  }
}
