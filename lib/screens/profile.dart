import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  static const String routeName = 'profile_screen';
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final loginProvide = Provider.of<LoginProvide>(context);

    return Scaffold(
      body: SafeArea(
        child: Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 100.0),
                  ),
                ),
                height: 250.0,
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 74.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          radius: 68.0,
                          backgroundImage: NetworkImage(
                            // sharedProfilePic!,
                            'https://thumbs.dreamstime.com/b/vector-illustration-avatar-dummy-logo-set-avatar-image-vector-icon-stock-vector-design-avatar-dummy-sign-137159692.jpg',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FutureBuilder(
                          future: loginProvide.getSharePref(),
                          builder: (context, snapshot) {
                            return Text(
                              loginProvide.userName ?? 'null',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Go Gym Fitness',
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(4),
                  child: Card(
                    elevation: 20.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const ListTile(
                      isThreeLine: true,
                      leading: Image(
                        image: AssetImage(
                          'assets/images/noun_Walk_1826969.png',
                        ),
                      ),
                      title: Text(
                        "present Days",
                      ),
                      textColor: Colors.black,
                      subtitle: Text(
                        "25 Days'\n march 2022",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image(
                        image: AssetImage('assets/images/Group 466.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(4),
                child: Card(
                  elevation: 20.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
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
                    borderRadius: BorderRadius.circular(15.0),
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
  }
}
