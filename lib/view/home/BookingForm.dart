import 'package:flutter/material.dart';

class BookingForm extends StatelessWidget {
  final double padding;
  const BookingForm({
    Key key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Scaffold(
          primary: false,
          appBar: AppBar(
            title: Text("Booking"),
          ),
          body: Center(
            child: Text("booking"),
          )),
    );
  }
}
