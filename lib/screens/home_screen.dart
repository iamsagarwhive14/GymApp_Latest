import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/screens/measurement.dart';
import 'package:gym_mgmtsystem/screens/payment_history.dart';
import 'package:gym_mgmtsystem/screens/product.dart';
import 'package:gym_mgmtsystem/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_Screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    PaymentHistory(),
    Profile(),
    Measurement(),
    Product(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (index) => setState(
          () => _selectedIndex = index,
        ),
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_history_outlined,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'profile',
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
        backgroundColor: const Color(0xFF00F0FF),
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
