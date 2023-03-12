import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_mgmtsystem/utilities/constant.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/gymmodel/GymListModel.dart';
import '../model/news/news_model.dart';
import '../model/product/ProductModel.dart';

class NewsProvider extends ChangeNotifier {
  NewsModel? _result;
  NewsModel? get apiResult => _result;
  String _pageNo = '1';

  Future<NewsModel?> newsData() async {
    var data;
    try {
      Response response = await get(
        Uri.parse(Constants.newsData).replace(
          queryParameters: {
            'page': _pageNo,
          },
        ),
      );
      if (response.statusCode == 200) {
        data = await jsonDecode(response.body.toString());
        _result = NewsModel.fromJson(data);
        notifyListeners();
        return NewsModel.fromJson(data);
      } else {
        print('no data is availabel');
      }
    } catch (e) {
      print(e);
    }
  }
}
