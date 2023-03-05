import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:gym_mgmtsystem/screens/measurement.dart';
import 'package:gym_mgmtsystem/screens/payment_history.dart';
import 'package:gym_mgmtsystem/screens/product_screen.dart';
import 'package:gym_mgmtsystem/screens/profile_screen_detail.dart';

import '../services/local_notification_service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_Screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String deviceTokenToSendPushNotification = '';
  int _selectedIndex = 0;
  List<Widget> screens = [
    ProfileScreenDetail(),
    PaymentHistory(),
    MeasurementScreen(
      id: '',
    ),
    ProductScreen(),
  ];
  // void getInitialMessage() async {
  //   RemoteMessage? message =
  //       await FirebaseMessaging.instance.getInitialMessage();
  //   if (message!.data['_id'] != null) {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => MeasurementScreen(
  //               id: message!.data['_id'],
  //             )));
  //     //   Navigator.push(
  //     //       context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //     // } else {
  //     //   ScaffoldMessenger.of(context).showSnackBar(
  //     //     SnackBar(
  //     //       content: Text('Invalide page'),
  //     //       duration: Duration(seconds: 10),
  //     //       backgroundColor: Colors.red,
  //     //       behavior: SnackBarBehavior.floating,
  //     //       shape: RoundedRectangleBorder(
  //     //         borderRadius: BorderRadius.circular(24),
  //     //       ),
  //     //       margin: EdgeInsets.only(
  //     //           bottom: MediaQuery.of(context).size.height -
  //     //               MediaQuery.of(context).size.height * 0.8,
  //     //           right: 20,
  //     //           left: 20),
  //     //     ),
  //     //   );
  //   }
  // }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
    FirebaseMessaging.onMessage.listen((message) {
      print('message received${message.notification!.title}');
      LocalNotificationService.createanddisplaynotification(message);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(message.notification!.body.toString()),
      //     duration: Duration(seconds: 5),
      //     backgroundColor: Colors.cyanAccent,
      //     behavior: SnackBarBehavior.floating,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(24),
      //     ),
      //     margin: EdgeInsets.only(
      //         bottom: MediaQuery.of(context).size.height -
      //             MediaQuery.of(context).size.height * 0.8,
      //         right: 20,
      //         left: 20),
      //   ),
      // );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      LocalNotificationService.createanddisplaynotification(message);
      print('message received${message.notification!.title}');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('App was opened by a notification'),
      //     duration: Duration(seconds: 5),
      //     backgroundColor: Colors.cyanAccent,
      //     behavior: SnackBarBehavior.floating,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(24),
      //     ),
      //     margin: EdgeInsets.only(
      //         bottom: MediaQuery.of(context).size.height -
      //             MediaQuery.of(context).size.height * 0.1,
      //         right: 20,
      //         left: 20),
      //   ),
      // );
    });
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }

  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2d5d7b),
        onTap: (index) => setState(
          () => _selectedIndex = index,
        ),
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            label: 'Measurement',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.production_quantity_limits_sharp,
            ),
            label: 'Products',
          ),
        ],
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2d5d7b),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PaymentHistory(),
          //   ),
          // );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        elevation: 2.0,
      ),
      body: screens[_selectedIndex],
    );
  }
}
