import 'package:flutter/material.dart';

showSnackBar(String text, BuildContext context,
    {required MaterialColor color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
