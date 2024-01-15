

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';



///shared preferences based class and use for save dummy_data
class Save<T> {

  Future<SharedPreferences> setter() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // await sharedPreferences.clear();
    return sharedPreferences;
  }

  Future<SharedPreferences> getter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }





  Future<void> setAuth(String value) async {
    SharedPreferences sharedPreferences = await setter();

    sharedPreferences.setString("auth", value);
  }

  Future<String> getAuth() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getString("auth")??"";
  }


  Future<void> setNotif(String value) async {
    SharedPreferences sharedPreferences = await setter();

    sharedPreferences.setString("notif", value);
  }

  Future<String> getNotif() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getString("notif")??"";
  }

  Future<void> setLocal(String value) async {
    SharedPreferences sharedPreferences = await setter();

    sharedPreferences.setString("local", value);
  }

  Future<String> getLocal() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getString("local")??"EN";
  }


  Future<void> setMode(String value) async {
    SharedPreferences sharedPreferences = await setter();

    sharedPreferences.setString("mode", value);
  }

  Future<String> getMode() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getString("mode")??"light";
  }



  Future<void> setIndex(int value) async {
    SharedPreferences sharedPreferences = await setter();

    sharedPreferences.setInt("index", value);
  }

  Future<int> getIndex() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getInt("index")??0;
  }


  Future<void> setGptCode(String value) async {
    SharedPreferences sharedPreferences = await setter();

    sharedPreferences.setString("Gpt", value);
  }

  Future<String> getGptCode() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getString("Gpt")??"";
  }

  Future<void> setGptList(String value) async {
    SharedPreferences sharedPreferences = await setter();
    sharedPreferences.setString("GptList", value);
  }

  Future<String> getGptList() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getString("GptList")??"""[]""";
  }


  Future<void> setIdList(String value) async {
    SharedPreferences sharedPreferences = await setter();
    sharedPreferences.setString("idList", value);
  }

  Future<String> getIdList() async {
    SharedPreferences sharedPreferences = await getter();
    return sharedPreferences.getString("idList")??"""[]""";
  }



}
