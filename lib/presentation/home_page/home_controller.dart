import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/presentation/second_page/second_page.dart';
import 'package:test_task/repository/api/home_page/home_service.dart';
import 'package:test_task/repository/api/home_page/login_model.dart';

class HomeController extends ChangeNotifier {
  LoginModel loginModel = LoginModel();
  late SharedPreferences sharedPreferences;

  postData(email, passWord, context) {
    log("HomeController -> postData()");
    var body = {"email": "$email", "password": "$passWord"};
    HomeService.postData(body).then((value) {
      if (value["status"] == 1) {
        var data = value["data"];
        storeReceivedData(data);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeSreen(),
          ),
        );
        log("${value}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Failed"),
          backgroundColor: Colors.red,
        ));
      }
    });
  }

  storeReceivedData(data) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(data);
    sharedPreferences.setString("userdata", storeData);
  }
}
