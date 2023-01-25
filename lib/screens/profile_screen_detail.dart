import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/check_out_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/check_in_provider.dart';

class ProfileScreenDetail extends StatefulWidget {
  const ProfileScreenDetail({Key? key}) : super(key: key);

  @override
  State<ProfileScreenDetail> createState() => _ProfileScreenDetailState();
}

class _ProfileScreenDetailState extends State<ProfileScreenDetail> {
  String userName = '';
  String profilePicture = '';
  String checkInTime = '';
  String checkOutTime = '';

  Future<void> getPersonDetailSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userName = sharedPreferences.getString('username') ?? '';
      profilePicture = sharedPreferences.getString('profile_picture') ?? '';
      checkInTime = sharedPreferences.getString('checkInTime') ?? '';
      checkOutTime = sharedPreferences.getString('checkInTime') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    getPersonDetailSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        color: Color(0xFF201E21),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              radius: 64.0,
                              backgroundImage: NetworkImage(
                                  profilePicture.toString()
                                  // sharedProfilePic!,
                                  // 'https://thumbs.dreamstime.com/b/vector-illustration-avatar-dummy-logo-set-avatar-image-vector-icon-stock-vector-design-avatar-dummy-sign-137159692.jpg',
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            userName.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Go Gym Fitness',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.17,
                        // margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
                        // padding: EdgeInsets.only(right: 10, left: 10),
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Card(
                          elevation: 20.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/noun_Walk_1826969.png',
                                ),
                              ),
                              Consumer<CheckInProvider>(
                                  builder: (context, dataProvider, child) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                      child: Text(
                                        'checkIn',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () async {
                                        dataProvider.checkInData();
                                      },
                                    ),
                                    Text(
                                      'checkin time: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      checkInTime.toString(),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                  ],
                                );
                              }),
                              Consumer<CheckOutProvider>(
                                  builder: (context, dataProvider, child) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                      child: Text(
                                        'checkOut',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () async {
                                        dataProvider.checkOutData();
                                      },
                                    ),
                                    Text(
                                      'checkout time: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      checkOutTime.toString(),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                  ],
                                );
                              }),
                              Image(
                                image:
                                    AssetImage('assets/images/Group 466.png'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(4),
                child: Card(
                  elevation: 20.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(
                            'assets/images/noun_calories_1180285.png'),
                      ),
                      const SizedBox(
                        width: 18.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Active Subscription',
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '1 Month Gym + Physical fitness ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Start Date:2022/02/04 ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'End Date:2022/02/04 ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: Card(
                  elevation: 20.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(
                            'assets/images/noun_calories_1180285.png'),
                      ),
                      const SizedBox(
                        width: 18.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Active Subscription',
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '1 Month Gym + Physical fitness ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Start Date:2022/02/04 ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'End Date:2022/02/04 ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: Card(
                  elevation: 20.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(
                            'assets/images/noun_calories_1180285.png'),
                      ),
                      const SizedBox(
                        width: 18.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Active Subscription',
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '1 Month Gym + Physical fitness ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Start Date:2022/02/04 ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'End Date:2022/02/04 ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
