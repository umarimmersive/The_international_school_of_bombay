import 'package:flutter/material.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text_widget.dart';

class ImageTextButton extends StatelessWidget {
  const ImageTextButton({super.key, required this.onTap, this.textTitle, this.assetImageUrl});

  final Function() onTap;
  final String? textTitle;
  final String? assetImageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 05,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SizedBox(
                height: 90,
                width: 90,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(
                          assetImageUrl!,
                          height: 20,
                          width: 20,
                          color: Colors.red,
                        )),
                    Expanded(
                        flex: 2,
                        child: Text_widget(
                          Simpletext: textTitle,
                          fontSize: 14.0,
                        )),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
