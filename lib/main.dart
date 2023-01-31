import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/check_attendence_provider.dart';
import 'package:gym_mgmtsystem/providers/check_in_provider.dart';
import 'package:gym_mgmtsystem/providers/check_out_provider.dart';
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
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
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
      ChangeNotifierProvider(
        create: (context) => CheckInProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CheckOutProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CheckAttendenceProvider(),
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
    );
  }
}
