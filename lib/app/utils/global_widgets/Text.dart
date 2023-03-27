import 'package:flutter/material.dart';


class GlobalLocalText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? wordSpacing;
  const GlobalLocalText(
      {Key? key,
        this.text,
        this.textColor,
        this.size,
        this.fontWeight,
        this.textAlign,
        this.wordSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign!=null? TextAlign.center :TextAlign.start,
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
 