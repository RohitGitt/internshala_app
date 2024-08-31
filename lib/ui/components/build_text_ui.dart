import 'package:flutter/material.dart';

Widget buildTextUI(
    {String? text,
    Color? textColor,
    double? fontSize,
    bool? bold,
    FontWeight? fontWeight}) {
  return Text(
    text ?? "",
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight:
          bold == true ? FontWeight.bold : fontWeight ?? FontWeight.normal,
    ),
  );
}
