import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final double borderRadius;
  final Color borderColor;
  final Color textColor;
  final Color bgColor;
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final int minLine;
  final int maxLine;
  const InputField({
    Key key,
    this.borderRadius,
    this.textColor,
    this.bgColor,
    this.controller,
    this.isPassword = false,
    this.hintText,
    this.minLine = 1,
    this.maxLine = 1,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadius,
          ),
        ),
        color: bgColor,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        maxLines: maxLine,
        minLines: minLine,
        style: TextStyle(
          color: textColor,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: (hintText != null) ? hintText : "",
          hintStyle: TextStyle(
            color: textColor,
          ),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
