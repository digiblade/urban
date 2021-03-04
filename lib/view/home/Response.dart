import 'package:flutter/material.dart';
import 'package:urban/component/Button.dart';

class ResponsePage extends StatelessWidget {
  final double padding;
  final bool response;
  const ResponsePage({
    Key key,
    this.padding,
    this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Scaffold(
        appBar: AppBar(
          title: (response) ? Text("Success") : Text("Failure"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (response)
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 128,
                ),
              if (!response)
                Icon(
                  Icons.highlight_off,
                  color: Colors.red,
                  size: 128,
                ),
              Text(
                "Booking " + ((response) ? "success" : "failure"),
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Button1(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xff040077),
                  textColor: Colors.white,
                  text: "Go Back",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
