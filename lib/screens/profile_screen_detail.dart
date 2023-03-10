import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_mgmtsystem/providers/check_out_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/logout_alert_dialogue.dart';
import '../providers/check_in_provider.dart';
import '../providers/login_provider.dart';

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
  String token = '';
  String gymLogo = '';
  bool _isLoading = true;

  Future<void> getPersonDetailSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userName = sharedPreferences.getString('username') ?? '';
      profilePicture = sharedPreferences.getString('profile_picture') ?? '';
      checkInTime = sharedPreferences.getString('checkInTime') ?? '';
      checkOutTime = sharedPreferences.getString('checkOutTime') ?? '';
      token = sharedPreferences.getString('token') ?? '';
      gymLogo = sharedPreferences.getString('logo') ?? '';
    });
  }

  @override
  void initState() {
    getPersonDetailSharedPreference();
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvide = Provider.of<LoginProvide>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.34,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Color(0xFF2d5d7b),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.teal,
                                radius: 70.0,
                                child: FutureBuilder(
                                  future:
                                      loginProvide.checkPrefsForUserProfile(),
                                  builder: (context, snapshot) {
                                    return CircleAvatar(
                                      backgroundColor: Colors.redAccent,
                                      radius: 64.0,
                                      backgroundImage: NetworkImage(
                                          loginProvide.profilePicture
                                          // sharedProfilePic!,
                                          // 'https://thumbs.dreamstime.com/b/vector-illustration-avatar-dummy-logo-set-avatar-image-vector-icon-stock-vector-design-avatar-dummy-sign-137159692.jpg',
                                          ),
                                    );
                                  },
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            FutureBuilder(
                                future: loginProvide.checkPrefsForUserName(),
                                builder: (context, snapshot) {
                                  return Text(
                                    loginProvide.userName ?? '',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  );
                                }),
                            const Text(
                              'Go Gym Fitness',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await LogoutShowDialoge(context);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs?.remove('token');
                    },
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 25,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          const Image(
                            color: const Color(0xFF2d5d7b),
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
                                      backgroundColor: const Color(0xFF2d5d7b),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    child: Text(
                                      'CheckIn',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: dataProvider.checkInResult
                                                ?.result.checkInTime ==
                                            null
                                        ? () async {
                                            await dataProvider
                                                .checkInData(context);
                                          }
                                        : null,
                                  ),
                                  Text(
                                    'CheckIn: ',
                                    style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    dataProvider.checkInResult?.result
                                                .checkInTime !=
                                            null
                                        ? '${dataProvider.checkInResult?.result.checkInTime}'
                                            .toString()
                                        : 'your time ',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Consumer<CheckOutProvider>(
                              builder: (context, dataProvider, child) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2d5d7b),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  child: Text(
                                    'CheckOut',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: dataProvider.checkOutResult?.result
                                              ?.checkInTime ==
                                          null
                                      ? () async {
                                          await dataProvider
                                              .checkOutData(context);
                                        }
                                      : null,
                                ),
                                Text(
                                  'CheckOut: ',
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  dataProvider.checkOutResult?.result
                                              ?.checkInTime !=
                                          null
                                      ? '${dataProvider.checkOutResult?.result!?.checkInTime!}'
                                          .toString()
                                      : 'your time',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                ),
                              ],
                            );
                          }),
                          Image(
                            color: const Color(0xFF2d5d7b),
                            image: AssetImage('assets/images/Group 466.png'),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(gymLogo),
                                  // AssetImage('assets/images/unnamed.png'),
                                ),
                              ),
                              margin: const EdgeInsets.all(10),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    margin: EdgeInsets.only(top: 5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF2d5d7b)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text('Active',
                                          style: GoogleFonts.openSans(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '1 Month Gym + Physical fitness ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
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
                                    height: 10.0,
                                  ),
                                  Text(
                                    'End Date:2022/02/04 ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
