import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final double size;
  final String badgeText;
  final Color badgeColor;
  final Color textColor;
  final double width;
  const Badge({
    Key key,
    this.size = 16,
    this.badgeText = "Badge",
    this.badgeColor = Colors.black,
    this.textColor = Colors.white,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 16,
      width: width,
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(size),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Center(
          child: Text(
            badgeText,
            style: TextStyle(
              color: textColor,
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
