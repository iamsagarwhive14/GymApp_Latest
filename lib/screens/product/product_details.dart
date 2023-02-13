import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';
import '../product_screen.dart';

class ProductDetail extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String image;
  final String createdAt;
  final String updatedAt;

  const ProductDetail(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.createdAt,
      required this.updatedAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //backgroundImage
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          image,
                        ))),
              ),
            ),
            //icon Widgets
            Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
            //introduction of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: MediaQuery.of(context).size.height * 0.3 - 20,
              child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "created Date:" + createdAt,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "updated Date:" + updatedAt,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.redAccent),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            description,
                            // 'Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves Hunting and gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            //Expandable text widgets
          ],
        ),
      ),
    );
  }
}
