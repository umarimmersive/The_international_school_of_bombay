import 'package:flutter/material.dart';


class GlobalLocalText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? size;
  final FontWeight? fontWeight;
  final double? wordSpacing;
  const GlobalLocalText(
      {Key? key,
        this.text,
        this.textColor,
        this.size,
        this.fontWeight,
        this.wordSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: size,
        //fontStyle: FontStyle.italic
      ),
    );
  }
}
 