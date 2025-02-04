import 'package:flutter/material.dart';

class DescriptionContainers extends StatelessWidget {
  final String text;
  final Widget value;
  const DescriptionContainers({super.key, required this.text,required this.value});

  @override
  Widget build(BuildContext context) {

    return  Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xff005E5E).withOpacity(0.6)
          ),
          borderRadius: BorderRadius.circular(9)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
        child: Column(
          children: [
            Text(text,
              style: TextStyle(
                  color: Color(0xff005E5E)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: value
            ),
          ],
        ),
      ),
    );
  }
}
