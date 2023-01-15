import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  static const String routeName = 'product_screen';
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Text('welcome to product screen')),
    );
  }
}
