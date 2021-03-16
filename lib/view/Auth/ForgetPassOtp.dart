import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:urban/component/Button.dart';
import 'package:urban/component/InputField.dart';
import 'package:urban/model/Authmodel.dart';
import 'package:urban/model/Velidation.dart';

import '../../main.dart';

class ForgetPassOtp extends StatefulWidget {
  ForgetPassOtp({Key key}) : super(key: key);

  @override
  _ForgetPassOtpState createState() => _ForgetPassOtpState();
}

class _ForgetPassOtpState extends State<ForgetPassOtp> {
  final TextEditingController emailCtrl = TextEditingController();

  final TextEditingController otpCtrl = TextEditingController();

  final TextEditingController passCtrl = TextEditingController();

  final TextEditingController confirmCtrl = TextEditingController();

  bool flag = false;

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
                      controller: emailCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          if (checkEmail(emailCtrl.text)) {
                            bool response = await resendOtp(emailCtrl.text);
                            FocusScope.of(context).unfocus();
                            if (response) {
                              Fluttertoast.showToast(
                                  msg: "Otp Send Successfully");
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Something went wrong");
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Enter Valid Email");
                          }
                        },
                        child: Text(
                          "Generate OTP.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 8,
                    ),
                    child: InputField(
                      controller: otpCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "OTP",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: InputField(
                      controller: passCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "Password",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: InputField(
                      controller: confirmCtrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      isPassword: true,
                      hintText: "Confirm Password",
                    ),
                  ),
                  if (!flag)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Button1(
                        onPressed: () async {
                          setState(() {
                            flag = true;
                          });
                          if (forgetPassword(emailCtrl.text, otpCtrl.text,
                              passCtrl.text, confirmCtrl.text)) {
                            bool resposne = await forgetPass(
                                emailCtrl.text, otpCtrl.text, passCtrl.text);
                            if (resposne) {
                              Fluttertoast.showToast(
                                  msg: "Password Change Succesfully");
                            } else {
                              Fluttertoast.showToast(msg: "Wrong OTP");
                            }
                          }
                          setState(() {
                            flag = false;
                          });
                        },
                        text: "Verify".toUpperCase(),
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
