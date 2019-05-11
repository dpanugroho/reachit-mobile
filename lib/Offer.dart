import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text("FOR YOU", style: TextStyle(fontSize: 20),),
          Card(
            child: new Container(
              width: 360.0,
              height: 160.0,
              padding: new EdgeInsets.all(32.0),
              child: new Column(
                children: <Widget>[
                  new Text('Hello World'),
                  new Text('How are you?')
                ],
              ),
            ),
          ),
          Text("BY CATEGORY", style: TextStyle(fontSize: 20),),
          Container(
            height: 300.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Bathroom Supplies'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Fruits and Vegetables'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Bread'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
