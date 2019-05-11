import 'package:flutter/cupertino.dart';

class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Text("Expense", style: TextStyle(fontSize: 28),),
    );
  }
}