import 'package:flutter/material.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Booking"),
          ),
          body: Center(
            child: Text("booking"),
          )),
    );
  }
}
