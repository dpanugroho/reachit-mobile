import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:reachit/pages/Expense.dart';
import 'package:reachit/pages/Offer.dart';
import 'package:reachit/pages/Scan.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras

  runApp(MyApp()
  );
}



class MyAppState extends State<MyApp> {
  int _selectedTab = 0;

  final _pageOptions = [
    Expense(),
    TakePictureScreen(),
    Offer(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromRGBO(134, 222, 183, 1.0),
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
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
            icon: Icon(Icons.shopping_basket, color: Colors.white,),
            title: Text('Expense', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, color: Colors.white, ),
            title: Text('Scan',style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer, color: Colors.white,),
            title: Text('Offers',style: TextStyle(color: Colors.white),),
          ),

        ],
      );
  }
}
