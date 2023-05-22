import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(),
          IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back,color: Colors.white),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 110),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 18),
                        radius: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'flutter_developer02',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      // Icon(Icons.verified, size: 15),
                      // SizedBox(width: 6),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Follow',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  // SizedBox(width: 6),
                  // Text(' 💙❤💛 ..'),
                   SizedBox(height: 50),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.music_note,
                  //       size: 15,
                  //     ),
                  //     Text(
                  //       'Original Audio - some music track--',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              // Column(
              //   children: [
              //     Icon(
              //       Icons.favorite_outline,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       '601k',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     SizedBox(height: 20),
              //     Icon(
              //       Icons.comment_rounded,
              //       color: Colors.white,
              //     ),
              //     Text('1123', style: TextStyle(color: Colors.white)),
              //     SizedBox(height: 20),
              //     Transform(
              //       transform: Matrix4.rotationZ(5.8),
              //       child: Icon(
              //         Icons.send,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}
