import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Expense.dart';
import 'Offer.dart';
import 'AddExpense.dart';
import 'Settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  int _selectedTab = 0;

  final _pageOptions = [
    Offer(),
    Expense(),
    Settings(),
    AddExpense(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: buildAppBar(),
      backgroundColor: Colors.transparent,
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(255, 153, 102, 3.0),
      title: Text('ReachIT'),
      elevation: 0.0,
      actions: <Widget>[],
      leading: new Container(),
    );
  }

  CurvedNavigationBar buildBottomNavBar() {
    CurvedNavigationBar _bottomNavigationBar = CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 250),
        backgroundColor: Color.fromRGBO(255, 94, 98, 1.0),
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          Icon(
            Icons.local_offer,
            size: 30,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
          ),
//          Icon(
//            Icons.add_circle,
//            size: 30,
//          ),

          Icon(
            Icons.settings,
            size: 30,
          ),
        ]);
    return _bottomNavigationBar;
  }
}
