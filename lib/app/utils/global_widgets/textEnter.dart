import 'package:flutter/material.dart';

class TextFieldShow extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final FontWeight fontWeight;
  final double fontsize;
  final double height;
  final double letterSpacing;
  final int maxLines;
  final TextDecoration decoration;
  final TextAlign textAlign;

  TextFieldShow({
    this.text = "",
    this.fontFamily = "Roboto",
    this.color = Colors.black87,
    this.fontsize = 15.0,
    this.height = 1.3,
    this.letterSpacing = 0.0,
    this.maxLines = 2,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.left,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        text,
        maxLines: maxLines == 0 ? null : maxLines,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontsize,
            decoration: decoration,
            height: height,
            letterSpacing: letterSpacing,
            color: Theme.of(context).iconTheme.color),
      ),
    );
  }
}

class TextFieldShowLowPadding extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final FontWeight fontWeight;
  final double fontsize;
  final double height;
  final double letterSpacing;
  final int maxLines;
  final TextDecoration decoration;
  final TextAlign textAlign;

  TextFieldShowLowPadding({
    this.text = "",
    this.fontFamily = "Roboto",
    this.color = Colors.black87,
    this.fontsize = 15.0,
    this.height = 1.3,
    this.letterSpacing = 0.0,
    this.maxLines = 2,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.left,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines == 0 ? null : maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontsize,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class TextFieldShowCOLOR extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final FontWeight fontWeight;
  final double fontsize;
  final double height;
  final double letterSpacing;
  final int maxLines;
  final TextDecoration decoration;
  final TextAlign textAlign;

  TextFieldShowCOLOR({
    this.text = "",
    this.fontFamily = "Roboto",
    this.color = Colors.black87,
    this.fontsize = 15.0,
    this.height = 1.0,
    this.letterSpacing = 0.0,
    this.maxLines = 2,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.left,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Text(
        text,
        maxLines: maxLines == 0 ? null : maxLines,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontsize,
            decoration: decoration,
            height: height,
            letterSpacing: letterSpacing,
            color: color),
      ),
    );
  }
}

class TextFieldShowButtonText extends StatelessWidget {
  String text;

  TextFieldShowButtonText({
    this.text = "",
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white),
    );
  }
}
