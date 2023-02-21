import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/gymmodel/GymListModel.dart';
import '../providers/gym_list_provider.dart';
import '../utilities/routes/route_name.dart';

Future<void> submitShowDialogue(
    BuildContext context, String gymName, String gymLogo) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  gymName = sharedPreferences.getString('name') ?? '';
  gymLogo = sharedPreferences.getString('logo') ?? '';

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Text(
            gymName.toString(),
          ),
        ),
        content: Image.network(
          gymLogo,
          fit: BoxFit.cover,
        ),
        actions: [
          Consumer<GymListProvider>(
            builder: (context, dataProvider, child) {
              return TextButton(
                onPressed: () async {
                  GymListModel? responseApi = dataProvider.apiResult;
                  if (responseApi?.response == true) {
                    await Navigator.pushReplacementNamed(
                        context, RouteName.loginScreen);
                  }
                },
                child: const Text(
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
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      );
    },
  );
}
