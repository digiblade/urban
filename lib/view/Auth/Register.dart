import 'package:flutter/material.dart';
import 'package:urban/component/Button.dart';
import 'package:urban/component/InputField.dart';

import '../../main.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController ctrl = TextEditingController();
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
                      controller: ctrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Username",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: ctrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Email",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: ctrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Mobile",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: ctrl,
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
                      controller: ctrl,
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
                      onPressed: () {},
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
}
