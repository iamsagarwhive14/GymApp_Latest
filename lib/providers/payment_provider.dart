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
    // print(apiToken);
    try {
      final response = await get(
        Uri.parse(Constants.baseUrl + Constants.paymentHistory),
        // Send authorization headers to the backend.
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Token $apiToken', // sending authorization token in headers
        },
      );
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        notifyListeners();
        // print(responseJson);
        return PaymentHistoryData.fromJson(responseJson);
      } else {
        print('data is not available');
      }
    } catch (e) {}
  }
}
