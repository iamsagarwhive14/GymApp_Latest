import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/model/user_model.dart';
import 'package:gym_mgmtsystem/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_Screen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final loginProvide = Provider.of<LoginProvide>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics:
              ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const Center(
                child: Flexible(
                  child: Image(
                    image: AssetImage('assets/images/image 11.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Card(
                  elevation: 20.0,
                  color: const Color(0xFFFAFAFA).withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // margin: EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 18.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Welcome Gymers',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 18.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Gym Go Fitness',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          decoration: const InputDecoration(
                            constraints:
                                BoxConstraints.tightFor(width: 330, height: 80),
                            labelText: 'email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                          onSubmitted: (val) {
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          decoration: const InputDecoration(
                            constraints:
                                BoxConstraints.tightFor(width: 330, height: 80),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            labelText: 'password',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Forgot password?',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                            height: 50.0,
                            width: 250,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50.0),
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0)),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await loginProvide.login(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  context);
                              setState(() {
                                _isLoading = false;
                              });

                              Usermodel? responseApi = loginProvide.apiResult;

                              if (responseApi?.response == true) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                            },
                            child: _isLoading
                                ? CircularProgressIndicator()
                                : const Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
