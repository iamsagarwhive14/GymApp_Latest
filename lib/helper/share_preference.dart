import 'package:shared_preferences/shared_preferences.dart';

String gymUrl = '';
String gymId = '';
Future<void> getGymListSharedPreference() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  gymUrl = sharedPreferences.getString('url') ?? '';
  gymId = sharedPreferences.getString('gymId') ?? '';
}
