import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/gym_list_provider.dart';
import 'package:gym_mgmtsystem/providers/login_provider.dart';
import 'package:gym_mgmtsystem/providers/measurement_provider.dart';
import 'package:gym_mgmtsystem/providers/payment_provider.dart';
import 'package:gym_mgmtsystem/utilities/routes/route_name.dart';
import 'package:gym_mgmtsystem/utilities/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sp;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sp = await SharedPreferences.getInstance();
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
      ChangeNotifierProvider(
        create: (context) => GymListProvider(),
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
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
      // routes: {
      //   LoginScreen.routeName: (context) => const LoginScreen(),
      //   HomeScreen.routeName: (context) => const HomeScreen(),
      //   PaymentHistory.routeName: (context) => const PaymentHistory(),
      //   MeasurementScreen.routeName: (context) => const MeasurementScreen(),
      //   Product.routeName: (context) => const Product(),
      //   Profile.routeName: (context) => const Profile(),
      //   SplashScreen.routeName: (context) => const SplashScreen(),
      // },
    );
  }
}
