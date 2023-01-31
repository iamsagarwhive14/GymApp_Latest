import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/screens/welcome/gym_welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/logout_alert_dialogue.dart';
import '../main.dart';
import '../utilities/routes/route_name.dart';
import 'login_screen.dart';

class Product extends StatelessWidget {
  static const String routeName = 'product_screen';
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Colors.black,
        actions: [
          InkWell(
            onTap: () async {
              await LogoutShowDialoge(context);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs?.remove('token');
            },
            child: Icon(
              Icons.logout,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(child: Text('welcome to product screen')),
    );
  }
}
