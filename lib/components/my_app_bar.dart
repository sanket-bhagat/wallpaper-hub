import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: 'Wallpaper',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Hub',
            style: TextStyle(
              color: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
