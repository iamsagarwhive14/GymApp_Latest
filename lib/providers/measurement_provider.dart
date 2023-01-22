import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/measurement/Measurement_model.dart';
import '../utilities/constant.dart';

class MeasurementProvider extends ChangeNotifier {
  Future<MeasurementModel?> measurementData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var apiToken = _prefs.getString('token');
    String gymUrlAPI = _prefs.getString('url') ?? '';
    String urlSet = gymUrlAPI + Constants.measurementData;
    try {
      final response = await get(
        Uri.parse(urlSet),
        // Send authorization headers to the backend.
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
        print(responseJson);
        notifyListeners();
        return MeasurementModel.fromJson(responseJson);
      } else {
        print('data is not available');
        print(
            "Niko" + 'data  is not created ' + response.statusCode.toString());
      }
    } catch (e) {}
  }
}
