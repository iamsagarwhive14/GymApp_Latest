import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';
import '../screens/welcome/gym_welcome_screen.dart';

LogoutShowDialoge(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Icon(
          Icons.logout,
          size: 24,
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs?.remove('token');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
            },
            child: Text(
              'yes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'No',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          )
        ],
      );
    },
  );
}
