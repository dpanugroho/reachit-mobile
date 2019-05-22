import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reachit/commons/ui.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List transactions = List();
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
      decoration: createBoxDecoration(),
      child: ListView.builder(itemBuilder: (context, index) {
        if (index == 0) {
          return buildLogo();
        } else if (index == 1) {
//          return _buildLogo();
        }
      }),
    );
  }
}

