import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Colors.dart';
import '../../component/Button.dart';
import '../../main.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16,
            ),
            child: Container(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Text(
                            "Name :- Akash Chourasia",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "AkashChourasia@gmail.com",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "8871714381",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button1(
                      onPressed: () {},
                      color: Primary_color,
                      text: "Change Password",
                      textColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button1(
                      onPressed: () {
                        logout(context);
                      },
                      color: Primary_color,
                      text: "Logout",
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            onPressed: () {},
            child: Text("Privacy Policy & Terms & Conditions"),
          ),
        )
      ],
    );
  }

  logout(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("isLogin");
    pref.remove("userId");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MyApp(),
      ),
    );
  }
}
