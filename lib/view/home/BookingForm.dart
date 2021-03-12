import 'package:flutter/material.dart';
import '../../component/InputField.dart';
import '../../component/Button.dart';
import 'Response.dart';

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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Booking"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Button1(
                  onPressed: () {},
                  text: "Take photo",
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Button1(
                  onPressed: () {},
                  text: "Enter Live Location",
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: InputField(
                  borderColor: Colors.black.withOpacity(0.2),
                  borderRadius: 4,
                  maxLine: 4,
                  minLine: 4,
                  hintText: "Address",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: InputField(
                  borderColor: Colors.black.withOpacity(0.2),
                  borderRadius: 4,
                  maxLine: 4,
                  minLine: 4,
                  hintText: "Notes",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Button1(
                  onPressed: () {
                    successPage(context, padding);
                  },
                  text: "Enter Live Location",
                  color: Color(0xff040077),
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
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

  successPage(context, pad) {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (BuildContext context) => ResponsePage(
        padding: pad,
        response: false,
      ),
    );
  }
}
