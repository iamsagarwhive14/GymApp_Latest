import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/show_snackbar.dart';
import '../model/checkoutmodel/CheckOutModel.dart';
import '../utilities/constant.dart';

class CheckOutProvider extends ChangeNotifier {
  CheckOutModel? _checkOutResult;
  CheckOutModel? get checkOutResult => _checkOutResult;
  String? checkOutTime = '';
  Future<CheckOutModel?> checkOutData(BuildContext context) async {
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
        _checkOutResult = CheckOutModel.fromJson(data);
        if (_checkOutResult?.response == false) {
          print(_checkOutResult?.msg.toString());
          var msg = _checkOutResult?.msg.toString();

          showSnackBar(msg!, context, color: Colors.indigo);
          notifyListeners();
        }
        print(_checkOutResult);
        var responseJson = jsonDecode(response.body);
        notifyListeners();
        setCheckOutTimeSharedPreference(
          data['result']['check_in_time'],
        );

        return CheckOutModel.fromJson(responseJson);
      } else {
        print('data  is not created ' + response.statusCode.toString());
      }
    } catch (e) {
      print(' this is checkout error $e');
    }
  }

  void setCheckOutTimeSharedPreference(String checkOutTime) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('checkOutTime', checkOutTime);
    notifyListeners();
  }

  Future<String?> checkPrefsForCheckOutTime() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var sharedcheckOutTime = _prefs.getString('checkOutTime');
    checkOutTime = sharedcheckOutTime!;
    print(checkOutTime);
    notifyListeners();
    return checkOutTime;
  }
}
