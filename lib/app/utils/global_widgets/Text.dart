import 'package:flutter/material.dart';


class GlobalLocalText extends StatelessWidget {
  final String? text;
  final int? maxLines;
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
        this.maxLines,
        this.wordSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign!=null? TextAlign.center :TextAlign.start,
      text ?? "",
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: textColor,
        fontWeight: fontWeight,
        fontSize: size,

        //fontStyle: FontStyle.italic
      ),
    );
  }
}
 