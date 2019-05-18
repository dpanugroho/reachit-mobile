import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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


Widget buildLogo() {
  return Container (
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.account_balance_wallet,
          color: Colors.white70,
          size: 32,
        ),
        Text(
          "ReachIT",
          style: TextStyle(color: Colors.white, fontSize: 32),
        )
      ],
    ),
  );
}
