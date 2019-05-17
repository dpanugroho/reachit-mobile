import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Expense.dart';
import 'Offer.dart';
import 'AddExpense.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  int _selectedTab = 0;

  final _pageOptions = [
    Expense(),
    AddExpense(),
    Offer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('ReachIT'),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(134, 222, 183, 1.0),
      currentIndex: _selectedTab,
      onTap: (int index) {
        setState(() {
          _selectedTab = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_basket,
            color: Colors.white,
          ),
          title: Text(
            'Expense',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: Colors.white,
          ),
          title: Text(
            'Add',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_offer,
            color: Colors.white,
          ),
          title: Text(
            'Offers',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
