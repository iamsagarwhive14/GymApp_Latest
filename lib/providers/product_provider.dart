import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/utilities/constant.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/gymmodel/GymListModel.dart';
import '../model/product/ProductModel.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? _result;
  ProductModel? get apiResult => _result;
  String _pageNo = '1';

  Future<ProductModel?> productData() async {
    var data;
    try {
      Response response = await get(
        Uri.parse(Constants.productData).replace(
          queryParameters: {
            'page': _pageNo,
          },
        ),
      );
      if (response.statusCode == 200) {
        print('response is true');
        data = await jsonDecode(response.body.toString());
        _result = ProductModel.fromJson(data);
        notifyListeners();
        return ProductModel.fromJson(data);
      } else {
        print('no data is availabel');
      }
    } catch (e) {
      print(e);
    }
  }
}
