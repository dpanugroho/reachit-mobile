import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            height: 160.0,
            child: new Sparkline(data: data),
          ),
          Text("Tomorrow", style: TextStyle(fontSize: 20),),
          Container(
            height: 120.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Milk'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Bread'),
                ),
              ],
            ),
          ),
          Text("Today", style: TextStyle(fontSize: 20),),
          Container(
            height: 120.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Milk'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Bread'),
                ),
              ],
            ),
          ),
          Text("Thursday, 9 May 2019", style: TextStyle(fontSize: 20),),
          Container(
            height: 16.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Milk'),
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