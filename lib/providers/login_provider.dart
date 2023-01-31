import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../helper/show_snackbar.dart';
import '../model/user_model.dart';
import '../utilities/constant.dart';

class LoginProvide extends ChangeNotifier {
  String gymUrl = '';
  String gymId = '';
  Usermodel? _result;
  String? userName;
  String? profilePicture;
  Usermodel? get apiResult => _result;

  Future<Object?> login(String email, password, context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String gymUrlAPI = sharedPreferences.getString('url') ?? '';
    gymId = sharedPreferences.getString('gymId') ?? '';
    var data;
    String urlSet = gymUrlAPI + Constants.login;
    try {
      Response response = await post(Uri.parse(urlSet), body: {
        'username': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        data = await jsonDecode(response.body.toString());
        _result = Usermodel.fromJson(data);

        if (_result?.response == false) {
          var msg = _result?.msg.toString();

          showSnackBar(msg!, context, color: Colors.red);
          notifyListeners();
        }

        pageRouteSharedPrefernce(
          data['result']['token'],
          data['result']['first_name'],
          data['result']['last_name'],
          data['result']['username'],
          data['result']['profile_picture'],
        );

        return _result;

        // print('account created successfully');
      } else {
        print(
            "Niko" 'account is not created ' + response.statusCode.toString());
      }
    } catch (e) {
      print("Niko$e");
    }
  }

  void pageRouteSharedPrefernce(String token, String firstName, String lastName,
      String username, String profilePicture) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('first_name', firstName);
    await sharedPreferences.setString('last_name', lastName);
    await sharedPreferences.setString('username', username);
    await sharedPreferences.setString('profile_picture', profilePicture);
    notifyListeners();
  }

  Future<String?> checkPrefsForUserName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var shareduserName = _prefs.getString('username');
    var sharedProfilePic = _prefs.getString('profile_picture');
    userName = shareduserName;
    notifyListeners();
    return userName;
  }

  Future<String?> checkPrefsForUserProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var sharedProfilePic = _prefs.getString('profile_picture');
    profilePicture = sharedProfilePic;
    notifyListeners();
    return profilePicture;
  }
}
