import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/ColorValues.dart';

class TextFieldDesigned extends StatelessWidget {
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final Widget? prefixIcon;
  final Color? hintStyle;
  final String hintText;
  final String initialValue;
  final int? maxLength, minLines;
  final int? maxLines;
  final bool readOnly;
  final bool obscureText;
  final TextInputType keyboardType;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  late final String? counterText;
  final List<LengthLimitingTextInputFormatter>? inputFormatters;
  TextFieldDesigned({
    this.onTap,
    this.obscureText=false,
    this.readOnly = false,
    this.controller,
    this.hintStyle,
    this.initialValue = "",
    this.suffixIcon,
    this.prefixIcon,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w300,
    this.autovalidateMode,
    this.hintText = "",
    this.maxLines,
    this.minLines,
    this.maxLength = 300,
    this.validator,
    this.keyboardType = TextInputType.number,
    this.textAlign = TextAlign.start,
    this.counterText = "",
    this.inputFormatters,
  });


  @override
  Widget build(BuildContext context) {
    return
    /*  TextFormField(
      inputFormatters: inputFormatters,
      enableInteractiveSelection:  enableInteractiveSelection,
      obscureText: obscureText,
      cursorColor: cursorColor,
      textCapitalization: TextCapitalization.sentences,
      readOnly: readOnly,
      autovalidateMode: autovalidateMode,
      validator: validator,
      onTap: onTap,
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textAlign: textAlign,
      buildCounter: counter,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
       // color: Theme.of(context).iconTheme.color,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: hintStyle,
        ),
        prefixIcon: prefixIcon,
        filled: true,
        counterText: counterText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:ColorValues.APP_THEME_COLORE,),
          //36325A
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValues.APP_THEME_COLORE,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValues.APP_THEME_COLORE,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorValues.APP_THEME_COLORE,),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        fillColor: Colors.transparent,
      ),
    );*/
      TextFormField(
        obscureText: obscureText,
        textCapitalization: TextCapitalization.sentences,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        autovalidateMode: autovalidateMode,
        validator: validator,
        cursorColor: ColorValues.BG_BT2,
        onTap: onTap,
        controller: controller,
        maxLength: maxLength,
        /*maxLines: maxLines,
        minLines: minLines,*/
        keyboardType: keyboardType,
        textAlign: textAlign,
        buildCounter: counter,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: hintStyle,
          ),
          prefixIcon: prefixIcon,
          filled: true,
          counterText: counterText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorValues.kRedColor),
            //36325A
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorValues.APP_THEME_COLORE),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorValues.kRedColor),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:ColorValues.kRedColor),
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: Colors.transparent,
        ),
      );
  }

  Widget counter(BuildContext context,
      {required int currentLength,
      required int? maxLength,
      required bool isFocused}) {
    if (isFocused && currentLength > 0) {
      return Text('$currentLength / $maxLength');
    } else {
      return Text("");
    }
  }
}
