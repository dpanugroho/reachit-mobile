import 'package:flutter/material.dart';
import 'package:reachit/commons/ui.dart';

class AddExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 0.0),
      decoration: createBoxDecoration(),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 512,
            child: Card(
              elevation: 3.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter your username'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
