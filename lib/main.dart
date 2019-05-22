import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reachit/pages/Home.dart';
import 'package:reachit/pages/Login.dart';
import 'package:reachit/pages/Splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


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
          primaryColor: Color.fromRGBO(255, 94, 98, 1.0),
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

Future<String> getCurrentUserTransaction() async {
  final prefs = await SharedPreferences.getInstance();
  var url = 'https://reachit-api.herokuapp.com/users/me/transactions';
  String auth = 'Bearer ' + prefs.get("accessToken");
  print(auth);

  var response =
  await http.get(url, headers: {HttpHeaders.authorizationHeader: auth});
//    Map<String, dynamic> jsonResponseBody = jsonDecode(response.body);
  return response.body;
}