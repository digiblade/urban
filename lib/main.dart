import 'package:flutter/material.dart';
import 'component/InputField.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
        // backgroundColor: Colors.black,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 80,
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: Image.asset("assets/logo/logo.jpg").image,
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
            Align(
              alignment: Alignment.centerRight,
            )
          ],
        ),
      ),
    );
  }
}
