// utils.dart
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginState() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
}
