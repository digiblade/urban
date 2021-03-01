import 'package:flutter/material.dart';
import '../../component/WelcomeCard.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: WelcomeCard(
              mentioned: "Hey User,",
              welcomeMsg: "Welcome to our app.",
              msg: "Please feel free to use it anytime.",
              greetings: "Thank you",
            ),
          )
        ],
      ),
    );
  }
}
