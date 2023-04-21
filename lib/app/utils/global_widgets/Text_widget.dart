import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Text_widget extends StatelessWidget {
  final Simpletext;
  final fontSize;
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;
   final fontFamily;
   final height;
   final maxLines;

  Text_widget({required this.Simpletext,required this.fontSize,  this.color,this.fontFamily,this.fontWeight,this.height,this.maxLines,this.textAlign      });

  @override
  Widget build(BuildContext context) {
    return Text(
      Simpletext,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
          height: height,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
           //color: Theme.of(context).iconTheme.color
           color: color
      ),
    );
  }
}

