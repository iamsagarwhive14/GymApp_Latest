import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/utilities/constant.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/show_snackbar.dart';
import '../model/gymmodel/GymListModel.dart';

class GymListProvider extends ChangeNotifier {
  GymListModel? _result;
  GymListModel? get apiResult => _result;

  Future<GymListModel?> GymListData(String gymId, context) async {
    var data;
    try {
      Response response = await get(
        Uri.parse(Constants.gymListData).replace(
          queryParameters: {
            'gym_id': gymId,
          },
        ),
      );
      if (response.statusCode == 200) {
        data = await jsonDecode(response.body.toString());
        print(data);
        _result = GymListModel.fromJson(data);
        // print(_result);

        if (_result?.response == false) {
          var msg = _result?.msg.toString();
          showSnackBar(msg!, context, color: Colors.red);
          notifyListeners();
        }

        setGymListSharedPreference(
          data['result']['name'],
          data['result']['logo'],
          data['result']['url'],
          data['result']['gym_id'],
        );

        return GymListModel.fromJson(data);
      } else {}
    } catch (e) {
      print(e);
    }
  }

  void setGymListSharedPreference(
      String name, String logo, String url, String gymId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('name', name);
    print(name);
    await sharedPreferences.setString('logo', logo);
    await sharedPreferences.setString('url', url);
    await sharedPreferences.setString('gym_id', gymId);
    notifyListeners();
  }
}
