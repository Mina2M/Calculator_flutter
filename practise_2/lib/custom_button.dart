import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  late String text;
  Function onButtonClick;

  CustomButton({required this.text, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed:() {
            onButtonClick(text);
          },
          child: Text(text, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
