import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/login_provider.dart';
import 'package:gym_mgmtsystem/providers/payment_provider.dart';
import 'package:gym_mgmtsystem/screens/details_screen.dart';
import 'package:gym_mgmtsystem/screens/home_screen.dart';
import 'package:gym_mgmtsystem/screens/login_screen.dart';
import 'package:gym_mgmtsystem/screens/measurement.dart';
import 'package:gym_mgmtsystem/screens/payment_history.dart';
import 'package:gym_mgmtsystem/screens/product.dart';
import 'package:gym_mgmtsystem/screens/profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvide(),
      ),
      ChangeNotifierProvider(
        create: (context) => PaymentHistoryProvider(),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        PaymentHistory.routeName: (context) => PaymentHistory(),
        Measurement.routeName: (context) => Measurement(),
        Product.routeName: (context) => Product(),
        Profile.routeName: (context) => Profile(),
      },
    );
  }
}
