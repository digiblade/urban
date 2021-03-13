import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "Url.dart";

checkAuth(String email, String password) async {
  bool status = false;
  Dio dio = Dio();
  SharedPreferences pref = await SharedPreferences.getInstance();
  FormData form = FormData.fromMap({
    "email": email,
    "password": password,
  });
  dynamic response = await dio.post(
    api + "auth/checkLogin",
    data: form,
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.data);
    status = data['response'];
    print(data);
  }
  if (status) {
    pref.setString("userId", email);
    pref.setBool("isLogin", true);
  }
  return status;
}
