import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/model/check/CheckInModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/constant.dart';

class CheckInProvider extends ChangeNotifier {
  Future<CheckInModel?> checkInData() async {
    var data;
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var apiToken = _prefs.getString('token');
    String gymUrlAPI = _prefs.getString('url') ?? '';

    String urlSet = gymUrlAPI + Constants.checkIn;

    try {
      final response = await post(
        Uri.parse(urlSet),
        // Send authorization headers here.
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Token $apiToken', // sending authorization token in headers
        },
      );
      if (response.statusCode == 200) {
        data = await jsonDecode(response.body.toString());
        print(response.statusCode);
        var responseJson = jsonDecode(response.body);
        notifyListeners();
        print(responseJson);

        setCheckInTimeSharedPreference(
          data['result']['check_in_time'],
        );
        return CheckInModel.fromJson(responseJson);
      } else {
        print('data is not available');
        print('data  is not created ' + response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void setCheckInTimeSharedPreference(String checkInTime) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('checkInTime', checkInTime);
    print(checkInTime);
    notifyListeners();
  }
}
