import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/check_attendence_provider.dart';
import 'package:gym_mgmtsystem/providers/check_in_provider.dart';
import 'package:gym_mgmtsystem/providers/check_out_provider.dart';
import 'package:gym_mgmtsystem/providers/gym_list_provider.dart';
import 'package:gym_mgmtsystem/providers/login_provider.dart';
import 'package:gym_mgmtsystem/providers/measurement_provider.dart';
import 'package:gym_mgmtsystem/providers/news_provider.dart';
import 'package:gym_mgmtsystem/providers/order_provider.dart';
import 'package:gym_mgmtsystem/providers/payment_provider.dart';
import 'package:gym_mgmtsystem/providers/product_provider.dart';
import 'package:gym_mgmtsystem/screens/newsScreen/news_screen.dart';
import 'package:gym_mgmtsystem/services/local_notification_service.dart';
import 'package:gym_mgmtsystem/services/notification_services.dart';
import 'package:gym_mgmtsystem/utilities/routes/route_name.dart';
import 'package:gym_mgmtsystem/utilities/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sp;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  NotificationService.initialize();
  LocalNotificationService.initialize();
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
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => OrderProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => NewsProvider(),
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
      // home: NewsScreen(),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
