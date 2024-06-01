import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final double width;
  const Button({super.key, required this.buttonColor, required this.text, required this.onPressed, required this.textColor, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
            //minimumSize: const MaterialStatePropertyAll(Size(40, 30)),
            backgroundColor:  MaterialStatePropertyAll(buttonColor),
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            )),
          ),
          onPressed:  onPressed,
          child:  Text(text,
            style:  TextStyle(
                color: textColor
            ),
          )
      ),
    );
  }
}
