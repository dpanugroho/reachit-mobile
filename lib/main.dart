import 'package:flutter/material.dart';
import 'package:reachit/pages/Home.dart';
import 'package:reachit/pages/Login.dart';
import 'package:reachit/pages/Splash.dart';

class ReachItApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReachItAppState();
  }
}

void main(){
  runApp(ReachItApp());
}

class ReachItAppState extends State<ReachItApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromRGBO(134, 222, 183, 1.0),
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => HomePage(),
        "/LoginPage": (BuildContext context) => LoginPage(),
      },
      home: SplashScreen(),
    );
  }
}
