import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs?.clear();
              Navigator.pushNamed(context, RouteName.loginScreen);
            },
            child: Icon(
              Icons.logout,
              size: 24,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(child: Text('welcome to product screen')),
    );
  }
}
