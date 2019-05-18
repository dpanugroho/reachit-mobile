import 'package:flutter/cupertino.dart';
import 'package:reachit/commons/ui.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      decoration: createBoxDecoration(),
      padding: EdgeInsets.all(24),
      child: Text("Settings", style: TextStyle(fontSize: 28),),
    );
  }
}
