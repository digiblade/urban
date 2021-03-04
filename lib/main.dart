import 'package:flutter/material.dart';
import 'package:urban/view/Auth/ForgetPassOtp.dart';
import 'package:urban/view/Auth/Register.dart';
import 'component/Button.dart';
import 'component/InputField.dart';
import 'view/Navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff040077),
        accentColor: Colors.white,
        // backgroundColor: Colors.black,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  final TextEditingController ctrl = TextEditingController();
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
                      hintText: "Email",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                    ),
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
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ForgetPassOtp(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Button1(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => NavigatorPage(),
                          ),
                        );
                      },
                      text: "Login".toUpperCase(),
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
                        builder: (BuildContext context) => RegisterPage(),
                      ),
                    );
                  },
                  text: "Don't have account?",
                  textColor: Colors.white.withOpacity(0.7),
                  clickText: "SignUp here",
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
