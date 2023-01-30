import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/login_provider.dart';
import '../res/components/input_text_field.dart';
import '../utilities/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  bool isTextFieldEnabled = true;
  bool _passwordVisible = true;

  String gymName = '';
  String gymLogo = '';

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Future<void> getGymListSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      gymName = sharedPreferences.getString('name') ?? '';
      gymLogo = sharedPreferences.getString('logo') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    getGymListSharedPreference();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

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
              Center(
                child: Flexible(
                  child: Image(
                    width: 300,
                    height: 120,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      gymLogo.toString(),
                    ),
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
                            children: [
                              Text(
                                gymName.toString(),
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
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              children: [
                                InputTextField(
                                  icon: IconButton(
                                    icon: Icon(_passwordVisible
                                        ? Icons.email
                                        : Icons.email),
                                    color: Colors.black45,
                                    onPressed: () {
                                      _passwordVisible = _passwordVisible;
                                    },
                                  ),
                                  enable: isTextFieldEnabled,
                                  myController: emailController,
                                  focusNode: emailFocusNode,
                                  onFieldSubmittedValue: (value) {},
                                  onValidator: (value) {
                                    return value.isEmpty
                                        ? 'Email cannot be blank'
                                        : null;
                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  hint: 'Enter email',
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputTextField(
                                  icon: IconButton(
                                    icon: Icon(_passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: Colors.black45,
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  enable: isTextFieldEnabled,
                                  myController: passwordController,
                                  focusNode: passwordFocusNode,
                                  onFieldSubmittedValue: (value) {},
                                  onValidator: (value) {
                                    return value.isEmpty
                                        ? 'Password cannot be blank'
                                        : null;
                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  hint: 'Enter password',
                                  obscureText: _passwordVisible,
                                ),
                              ],
                            ),
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
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                await loginProvide.login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    context);
                                setState(() {
                                  _isLoading = false;
                                  isTextFieldEnabled = true;
                                });

                                Usermodel? responseApi = loginProvide.apiResult;
                                setState(() {
                                  isTextFieldEnabled = true;
                                });

                                if (responseApi?.response == true) {
                                  Navigator.pushNamed(
                                      context, RouteName.homeScreen);
                                }
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
