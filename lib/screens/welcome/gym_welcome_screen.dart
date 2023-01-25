import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/gym_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/logout_alert_dialogue.dart';
import '../../helper/show_snackbar.dart';
import '../../helper/submit_alert_dialogue.dart';
import '../../model/gymmodel/GymListModel.dart';
import '../../utilities/routes/route_name.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isLoading = false;
  String gymName = '';
  String gymLogo = '';
  TextEditingController idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> getGymDetailSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      gymName = sharedPreferences.getString('username') ?? '';
      gymLogo = sharedPreferences.getString('profile_picture') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    getGymDetailSharedPreference();
  }

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
                child: Center(
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Please provide your Gym id :',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
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
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'GymID cannot be blank'
                                    : null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Get your Gym Id from your concerned Gym',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
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
                              if (_formKey.currentState!.validate()) {
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
                                  SubmitshowDialoge(context, gymName, gymLogo);
                                } else if (responseApi?.response == false) {
                                  var msg = responseApi!.msg.toString();
                                  print(responseApi!.msg.toString());
                                  showSnackBar(msg!, context,
                                      color: Colors.red);
                                }
                              }
                            },
                          ),
                        )
                      ]),
                ),
              );
            },
          )),
    );
  }
}
