import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPageController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  bool isLoading = false;
  var data;

  getReceivedData() async {
    isLoading = true;
    notifyListeners();
    sharedPreferences = await SharedPreferences.getInstance();
    var storeData = sharedPreferences.getString("userdata");
    data = jsonDecode(storeData!);

    log("data -> ${data}");
    isLoading = false;
    notifyListeners();
  }
}
