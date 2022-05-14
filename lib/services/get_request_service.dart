import 'dart:convert';
import 'package:covid19app/models/messenger_model.dart';
import 'package:http/http.dart' as http;

class ApiCallService {
  static Future <MessengerModel> getRequest({required String url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      var r = json.decode(response.body);

      if (response.statusCode == 200) {
        return MessengerModel(success: true, message: r['Message'], data: r);
      } else {
        return MessengerModel(
            success: false, message: r['Message'], data: null);
      }
    } catch (err) {
      return MessengerModel(
          success: false, message: 'Exception $err', data: null);
    }
  }

  static Future <MessengerModel> postRequest({required String url, required Map body}) async {
    try {
      http.Response response = await http.post(Uri.parse(url),body: body);

      var r = json.decode(response.body);

      if (response.statusCode == 200) {
        return MessengerModel(success: true, message: r['Message'], data: r);
      } else {
        return MessengerModel(
            success: false, message: r['Message'], data: null);
      }
    } catch (err) {
      return MessengerModel(
          success: false, message: 'Exception $err', data: null);
    }
  }


}
