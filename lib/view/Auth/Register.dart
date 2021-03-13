import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:urban/component/Button.dart';
import 'package:urban/component/InputField.dart';

import '../../main.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 80,
                    ),
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage:
                            Image.asset("assets/logo/logo.jpg").image,
                        radius: 54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 64,
                      left: 16,
                      right: 16,
                    ),
                    child: InputField(
                      controller: userCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Username",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: emailCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Email",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: mobileCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Mobile",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: passwordCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      isPassword: true,
                      hintText: "Password",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: confirmPassCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      isPassword: true,
                      hintText: "Confirm Password",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24,
                    ),
                    child: Button1(
                      onPressed: () async {
                        bool response = await checkRegister(
                          userCtrl.text,
                          emailCtrl.text,
                          mobileCtrl.text,
                          passwordCtrl.text,
                          confirmPassCtrl.text,
                        );
                        if (response) {}
                      },
                      text: "Register".toUpperCase(),
                      height: 54,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: MixedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyApp(),
                      ),
                    );
                  },
                  text: "Already have account?",
                  textColor: Colors.white.withOpacity(0.7),
                  clickText: "SignIn here",
                  clickColor: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  checkRegister(
    String username,
    String email,
    String mobile,
    String password,
    String confirmPass,
  ) async {
    bool response = true;
    if (username.length == 0 ||
        email.length == 0 ||
        mobile.length == 0 ||
        password.length == 0 ||
        confirmPass.length == 0) {
      Fluttertoast.showToast(msg: "All Fields are required");
      response = false;
    } else {
      if (password != confirmPass) {
        Fluttertoast.showToast(msg: "Password And  Confirm Password Not");
        response = false;
      }
    }
    return response;
  }

  submitRegister(
    String username,
    String email,
    String mobile,
    String password,
    String confirmPass,
  ) async {
    bool response = await registerUser(){}
  }
}
