import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyVideoWidget extends StatefulWidget {
  bool isPositioned;
  String videoUrl, thumbNailUrl;
  int index;

  MyVideoWidget({
    Key? key,
    required this.isPositioned,
    required this.index,
    required this.videoUrl,
    required this.thumbNailUrl,
  }) : super(key: key);

  @override
  State<MyVideoWidget> createState() => _MyVideoWidgetState();
}

class _MyVideoWidgetState extends State<MyVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        height: 200, // height --> 1
        color: widget.isPositioned ? Colors.red : Colors.black,
        child: Center(
            child: Text(
              widget.isPositioned ? widget.videoUrl : widget.thumbNailUrl,
              style: const TextStyle(color: Colors.white),
            ))),
    SizedBox(height: 50 ),// height --> 2,
    Text("Video Name: ${widget.index}")
    ],
    );
  }
}