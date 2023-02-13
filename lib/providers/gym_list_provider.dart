import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/utilities/constant.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        _result = GymListModel.fromJson(data);
        if (_result?.response == false) {
          var msg = _result?.msg.toString();
          print(_result?.response);
          // showSnackBar(msg!, context, color: Colors.red);
          notifyListeners();
        }
        setGymListSharedPreference(
          data['result']['name'],
          data['result']['logo'],
          data['result']['url'],
          data['result']['gym_id'],
        );
        notifyListeners();
        return GymListModel.fromJson(data);
      } else {}
    } catch (e) {
      print(e);
    }
  }

  void setGymListSharedPreference(
      String name, String logo, String url, String gymId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('name', name.toString());
    await sharedPreferences.setString('logo', logo.toString());
    await sharedPreferences.setString('url', url.toString());
    await sharedPreferences.setString('gymId', gymId.toString());
    notifyListeners();
  }
}
