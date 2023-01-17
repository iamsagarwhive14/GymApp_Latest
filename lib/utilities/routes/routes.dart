import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/utilities/routes/route_name.dart';

import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/welcome/gym_welcome_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteName.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
