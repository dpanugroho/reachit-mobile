import 'package:flutter/cupertino.dart';

BoxDecoration createBoxDecoration() {
  return BoxDecoration(
    // Box decoration takes a gradient
    gradient: LinearGradient(
      // Where the linear gradient begins and ends
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      // Add one stop for each color. Stops should increase from 0 to 1
//          stops: [0.1, 0.5, 0.7, 0.9],
      colors: [
        // Colors are easy thanks to Flutter's Colors class.
        Color.fromRGBO(255, 153, 102, 1.0),
        Color.fromRGBO(255, 94, 98, 1.0)
      ],
    ),
  );
}

