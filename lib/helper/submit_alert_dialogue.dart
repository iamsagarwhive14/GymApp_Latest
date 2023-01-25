import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/gymmodel/GymListModel.dart';
import '../providers/gym_list_provider.dart';
import '../screens/welcome/gym_welcome_screen.dart';
import '../utilities/routes/route_name.dart';

SubmitshowDialoge(BuildContext context, String gymName, String gymLogo) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var gymName = sharedPreferences.getString('name') ?? '';
  var gymLogo = sharedPreferences.getString('logo') ?? '';
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(child: Text(gymName.toString())),
        content: Image.network(
          gymLogo.toString(),
          fit: BoxFit.cover,
        ),
        actions: [
          Consumer<GymListProvider>(
            builder: (context, dataProvider, child) {
              return TextButton(
                onPressed: () {
                  GymListModel? responseApi = dataProvider.apiResult;
                  if (responseApi?.response == true) {
                    Navigator.pushNamed(context, RouteName.loginScreen);
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancle',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      );
    },
  );
}
