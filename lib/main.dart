import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urban/model/Velidation.dart';
import 'Colors.dart';
import 'model/Authmodel.dart';
import 'view/Auth/ForgetPassOtp.dart';
import 'view/Auth/Register.dart';
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
        primaryColor: Primary_color,
        accentColor: Colors.white,
        // backgroundColor: Colors.black,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  bool flag = false;
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

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
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                    ),
                    child: InputField(
                      controller: passCtrl,
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
                  if (!flag)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Button1(
                        onPressed: () async {
                          setState(() {
                            flag = true;
                          });
                          FocusScope.of(context).unfocus();
                          await submitLogin(emailCtrl.text, passCtrl.text);
                          setState(() {
                            flag = false;
                          });
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

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool status = pref.getBool("isLogin") ?? false;
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => NavigatorPage(),
        ),
      );
    }
  }

  submitLogin(String email, String password) async {
    print(email);
    if (!checkEmail(email) || email.length == 0) {
      Fluttertoast.showToast(msg: "Enter Valid Email");
      return null;
    }
    if (password.length == 0) {
      Fluttertoast.showToast(msg: "Please Enter Valid Password");
      return null;
    }
    bool check = await checkAuth(email, password);
    if (check) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => NavigatorPage(),
        ),
      );
    } else {
      Fluttertoast.showToast(msg: "Invalid ID/Password");
    }
  }
}
