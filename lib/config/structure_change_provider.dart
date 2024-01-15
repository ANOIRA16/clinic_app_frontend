import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StructureChangeProvider with ChangeNotifier {

  Locale _currentLocale = const Locale("en");

  String _currentLanguageCode = "EN";

  bool _isNightMode = false;


  Locale get currentLocale => _currentLocale;

  String get currentLanguageCode => _currentLanguageCode;

  bool get isNightMode => _isNightMode;


  void changeLocale(String locale) {
    _currentLocale = Locale(locale);
    notifyListeners();
  }

  void changeCode(String languageCode) {
    _currentLanguageCode = languageCode;
    notifyListeners();
  }

  void changeMode(bool nightMode) {
    _isNightMode = nightMode;
    notifyListeners();
  }


}
