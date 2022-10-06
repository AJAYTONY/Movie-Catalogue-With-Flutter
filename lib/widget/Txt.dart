import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  int maxLines;
  TextOverflow overflow;
  String? fontFamily;

  Txt(this.text,
      {this.fontSize = 15,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.maxLines = 10,
      this.overflow = TextOverflow.visible,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
