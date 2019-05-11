import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Strawberry'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Coffee'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Tea'),
          ),
        ],
      ),

    );
  }
}