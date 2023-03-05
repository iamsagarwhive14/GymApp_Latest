import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../helper/show_snackbar.dart';
import '../model/order/order_model.dart';

class OrderProvider extends ChangeNotifier {
  String gymUrl = '';
  String eachGymId = '';
  String eachUserId = '';
  OrderModel? _result;
  String userName = '';
  String profilePicture = '';
  OrderModel? get apiResult => _result;
  Future<Object?> orderMethode(context, String name, String address,
      String phone, String productId, String quantity) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String gymUrlAPI = sharedPreferences.getString('url') ?? '';
    eachGymId = sharedPreferences.getString('eachGymId') ?? '2';
    eachUserId = sharedPreferences.getString('userId') ?? '20';
    print('this is gym id $eachGymId');
    print('this is user id $eachUserId');
    print('this is product id $productId');
    var data;
    // String urlSet = gymUrlAPI + Constants.ordertData;
    try {
      print('post request');
      Response response = await post(
        Uri.parse('https://gymsoftwarenepal.com/api/quick_order'),
        body: {
          'gym_id': eachGymId,
          'user_id': eachUserId,
          'name': name,
          'address': address,
          'phone': phone,
          'product_id': productId,
          'qty': quantity,
        },
      );
      print('sagar response is created');
      if (response.statusCode == 200) {
        print(response.statusCode);
        data = await jsonDecode(response.body.toString());
        _result = OrderModel.fromJson(data);
        print(_result!.result);
        if (_result?.response == false) {
          var msg = _result?.msg.toString();
          showSnackBar(msg!, context, color: Colors.red);
          notifyListeners();
        } else if (_result?.response == true) {
          var msg = _result?.msg.toString();

          showSnackBar(msg!, context, color: Colors.cyan);
          notifyListeners();
        }
        return _result;
      } else {
        print(
            "Niko" 'account is not created ' + response.statusCode.toString());
      }
    } catch (e) {
      print("Exception Sagar aryal  $e");
    }
  }
}
