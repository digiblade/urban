import 'package:flutter/material.dart';
import 'package:urban/component/Button.dart';
import 'package:urban/component/InputField.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController ctrl = TextEditingController();
  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                        hintText: "Password",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            print(ctrl.text);
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
                        onPressed: () {},
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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MixedButton(
                    onPressed: () {},
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
      ),
    );
  }
}
