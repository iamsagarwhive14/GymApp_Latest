import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/model/check/CheckInModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/show_snackbar.dart';
import '../utilities/constant.dart';

class CheckInProvider extends ChangeNotifier {
  CheckInModel? _checkInResult;
  CheckInModel? get checkInResult => _checkInResult;
  String? checkInTime = '';

  Future<CheckInModel?> checkInData(BuildContext context) async {
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
        _checkInResult = CheckInModel.fromJson(data);
        if (_checkInResult?.response == false) {
          print(_checkInResult?.msg.toString());
          var msg = _checkInResult?.msg.toString();

          showSnackBar(msg!, context, color: Colors.indigo);
          notifyListeners();
        }
        var responseJson = jsonDecode(response.body);
        notifyListeners();
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
    notifyListeners();
  }

  Future<String?> checkPrefsForCheckInTime() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var sharedCheckInTime = _prefs.getString('checkInTime');
    checkInTime = sharedCheckInTime!;
    notifyListeners();
    return checkInTime;
  }
}
