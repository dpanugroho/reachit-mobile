import 'package:flutter/material.dart';
import 'Expense.dart';
import 'Offer.dart';
import 'Scan.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedTab = 0;

  final _pageOptions = [
    Expense(),
    Scan(),
    Offer(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loopt In'),
        ),
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
             _selectedTab=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Expense'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text('Scan'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              title: Text('Offers'),
            ),
          ],
        ),
      ),
    );
  }
}
