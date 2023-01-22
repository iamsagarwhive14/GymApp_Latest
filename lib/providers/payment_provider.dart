import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/PaymentHistory.dart';
import '../utilities/constant.dart';

class PaymentHistoryProvider extends ChangeNotifier {
  Future<PaymentHistoryData?> paymentHistory() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var apiToken = _prefs.getString('token');
    String gymUrlAPI = _prefs.getString('url') ?? '';

    String urlSet = gymUrlAPI + Constants.paymentHistory;

    try {
      final response = await get(
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
        print(response.statusCode);
        var responseJson = jsonDecode(response.body);
        notifyListeners();
        print(responseJson);
        return PaymentHistoryData.fromJson(responseJson);
      } else {
        print('data is not available');
        print('data  is not created ' + response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
