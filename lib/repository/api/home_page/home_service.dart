import 'dart:developer';

import 'package:test_task/repository/helper/api_helper.dart';

class HomeService {
  static Future<dynamic> postData(body) async {
    try {
      var decodedData = ApiHelper.postData(
          endPoint: "http://axnoldigitalsolutions.in/Training/api/login",
          body: body);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
