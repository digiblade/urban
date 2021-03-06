import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urban/view/Auth/OtpVerification.dart';
import "Url.dart";
import '../view/Navigator.dart';
import 'Velidation.dart';

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

Future<bool> registerUser(
  String username,
  String email,
  String mobile,
  String password,
  BuildContext context,
) async {
  bool status = false;
  Dio dio = Dio();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  FormData form = FormData.fromMap({
    "email": email,
    "username": username,
    "mobile": mobile,
    "password": password,
  });
  dynamic response = await dio.post(
    api + "auth/userRegister",
    data: form,
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.data);
    status = data['response'];
    print(data);
  }
  if (status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => OtpVarification(
          email: email,
        ),
      ),
    );
  }
  return status;
}

resendOtp(String email) async {
  bool status = false;
  Dio dio = Dio();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  FormData form = FormData.fromMap({
    "email": email,
  });
  dynamic response = await dio.post(
    api + "auth/generateOTP",
    data: form,
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.data);
    status = data['response'];
    print(data);
  }
  return status;
}

Future<bool> otpVerification(
  String email,
  String otp,
  BuildContext context,
) async {
  bool status = false;
  Dio dio = Dio();
  SharedPreferences pref = await SharedPreferences.getInstance();
  FormData form = FormData.fromMap({
    "email": email,
    "otp": otp,
  });
  dynamic response = await dio.post(
    api + "auth/userVerification",
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => NavigatorPage(),
      ),
    );
  }
  return status;
}

forgetPass(String email, String otp, String password) async {
  bool status = false;
  Dio dio = Dio();
  FormData form = FormData.fromMap({
    "otp": otp,
    "email": email,
    "password": password,
  });
  dynamic response = await dio.post(api + "auth/forgetPassword", data: form);
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.data);
    status = data['response'];
  }
  return status;
}

forgetPassword(String email, String otp, String pass, String confirm) {
  if (!checkEmail(email)) {
    Fluttertoast.showToast(msg: "Enter Valid Email");
    return false;
  }
  if (otp.length == 0) {
    Fluttertoast.showToast(msg: "Enter Valid OTP");
    return false;
  }
  if (pass.length < 6 || (pass != confirm)) {
    Fluttertoast.showToast(
        msg: "Enter Valid Password. Password should be minimum 6 character");
    return false;
  }
  return true;
}
