import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 1;

  startTime() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? null;

    return Timer(Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      if (accessToken == null) {
        Navigator.of(context).pushReplacementNamed('/LoginPage');
      } else {
        Navigator.of(context).pushReplacementNamed('/HomePage');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightBlue);
  }
}
