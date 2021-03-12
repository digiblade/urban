import 'package:flutter/material.dart';

class Button1 extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final Function onPressed;

  Button1({
    Key key,
    this.text,
    this.height = 40,
    this.width = double.infinity,
    this.color = Colors.white,
    this.textColor = Colors.black,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _Button1State createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color)),
        onPressed: widget.onPressed,
        child: Center(
          child: Text(
            (widget.text != null) ? widget.text : "",
            style: TextStyle(
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class MixedButton extends StatelessWidget {
  final String text;
  final String clickText;
  final Color textColor;
  final Color clickColor;
  final Function onPressed;

  const MixedButton({
    Key key,
    this.text = "",
    this.clickText = "",
    this.textColor = Colors.white,
    this.clickColor = Colors.black,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            clickText,
            style: TextStyle(
              color: clickColor,
            ),
          ),
        ),
      ],
    );
  }
}
