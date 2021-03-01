import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final String mentioned;
  final String welcomeMsg;
  final String msg;
  final String greetings;
  const WelcomeCard({
    Key key,
    this.mentioned,
    this.welcomeMsg,
    this.msg,
    this.greetings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Color(0xff040077),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mentioned != null)
                Text(
                  mentioned,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (welcomeMsg != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    welcomeMsg,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (msg != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    msg,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (greetings != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    greetings,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
