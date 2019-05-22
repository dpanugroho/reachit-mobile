import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reachit/commons/ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _logout() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Navigator.of(context).pushNamed("/LoginPage");
    }

    List transactions = List();
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
      decoration: createBoxDecoration(),
      child: ListView(
        children: <Widget>[
          buildLogo(),
          ListTile(
            onTap: _logout,
            leading: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
