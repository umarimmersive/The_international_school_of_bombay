import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedBorderDropdown extends GetView {
  final List<String> items;
  final String hintText;

  RedBorderDropdown({required this.items, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButtonFormField<String>(
        value: null,
        hint: Text(hintText),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onChanged: (String? newValue) {
          // do something with the selected value
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
