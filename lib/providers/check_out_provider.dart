import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/model/check/CheckInModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/checkoutmodel/CheckOutModel.dart';
import '../utilities/constant.dart';

class CheckOutProvider extends ChangeNotifier {
  Future<CheckOutModel?> checkOutData() async {
    var data;
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var apiToken = _prefs.getString('token');
    String gymUrlAPI = _prefs.getString('url') ?? '';

    String urlSet = gymUrlAPI + Constants.checkOut;

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
        setCheckOutTimeSharedPreference(
          data['result']['check_out_time'],
        );

        return CheckOutModel.fromJson(responseJson);
      } else {
        print('data is not available');
        print('data  is not created ' + response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void setCheckOutTimeSharedPreference(String checkOutTime) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('checkInTime', checkOutTime);
    print(checkOutTime);
    notifyListeners();
  }
}
