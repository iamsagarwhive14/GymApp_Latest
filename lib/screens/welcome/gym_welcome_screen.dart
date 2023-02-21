import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/providers/gym_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/submit_alert_dialogue.dart';
import '../../model/gymmodel/GymListModel.dart';

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
  @override
  void initState() {
    super.initState();
    getGymDetailSharedPreference();
  }

  Future<void> getGymDetailSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      gymName = sharedPreferences.getString('name') ?? '';
      gymLogo = sharedPreferences.getString('logo') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Welcome Gymers '),
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
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: const Text(
                              'Please provide your Gym id :',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              controller: idController,
                              decoration: const InputDecoration(
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
                            padding: const EdgeInsets.only(left: 15),
                            child: const Text(
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
                                ? const Center(
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
                                  await submitShowDialogue(
                                      context, gymName, gymLogo);
                                } else if (responseApi?.response == false) {
                                  // print('this is else part');
                                  // var msg = responseApi!.msg.toString();
                                  // print('messages gym:${responseApi!.msg}');
                                  // await showSnackBar(msg!, context,
                                  //     color: Colors.red);
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
