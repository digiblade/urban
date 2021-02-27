import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final double borderRadius;
  final Color textColor;
  final Color bgColor;
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  const InputField({
    Key key,
    this.borderRadius,
    this.textColor,
    this.bgColor,
    this.controller,
    this.isPassword = false,
    this.hintText,
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
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
