import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/gym_list_provider.dart';
import 'package:provider/provider.dart';

import '../../model/gymmodel/GymListModel.dart';
import '../../utilities/routes/route_name.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isLoading = false;

  TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text('Welcome Gymers '),
            centerTitle: true,
          ),
          body: Consumer<GymListProvider>(
            builder: (context, dataProvider, child) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: Flexible(
                          child: Image(
                            image: AssetImage('assets/images/image 11.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'please enter you gym id :',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: idController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Gym id',
                          contentPadding: EdgeInsets.all(17),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                            height: 50.0,
                            width: 250,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            child: _isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : Text('submit'),
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });

                              await dataProvider?.GymListData(
                                  idController.text, context);
                              setState(() {
                                _isLoading = false;
                              });
                              GymListModel? responseApi =
                                  dataProvider.apiResult;
                              if (responseApi?.response == true) {
                                Navigator.pushNamed(
                                    context, RouteName.loginScreen);
                              }
                            },
                          ))
                    ]),
              );
            },
          )),
    );
  }
}
