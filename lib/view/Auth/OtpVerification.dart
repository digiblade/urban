import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/Authmodel.dart';
import '../../component/Button.dart';
import '../../component/InputField.dart';
import '../../main.dart';

class OtpVarification extends StatefulWidget {
  final String email;
  OtpVarification({
    Key key,
    this.email = "",
  }) : super(key: key);

  @override
  _OtpVarificationState createState() => _OtpVarificationState();
}

class _OtpVarificationState extends State<OtpVarification> {
  final TextEditingController ctrl = TextEditingController();
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
                      controller: ctrl,
                      borderRadius: 4,
                      textColor: Colors.white,
                      bgColor: Colors.white.withOpacity(0.5),
                      hintText: "OTP",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          bool response = await resendOtp(widget.email);
                          FocusScope.of(context).unfocus();
                          if (response) {
                            Fluttertoast.showToast(
                                msg: "Otp Send Successfully");
                          } else {
                            Fluttertoast.showToast(msg: "Something went wrong");
                          }
                        },
                        child: Text(
                          "Resend OTP.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
                          bool response = await otpVerification(
                            widget.email,
                            ctrl.text,
                            context,
                          );
                          if (!response) {
                            Fluttertoast.showToast(msg: "Wrong Otp");
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
