import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reachit/commons/ui.dart';

class Offer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 32.0, 8.0, 0.0),
      decoration: createBoxDecoration(),
      child: ListView.builder(itemBuilder: (context, index) {
        if (index == 0) {
          return buildLogo();
        } else if (index == 1) {
          return Container(
//            color: Colors.white,
            padding: EdgeInsets.only(bottom: 8),
            height: 352,
            child: PageView(
              controller: PageController(viewportFraction: 0.8),
              scrollDirection: Axis.horizontal,
              children: buildPromotionListWidget(),
            ),
          );
        } else if (index == 2) {
          return Card(
            elevation: 3.0,
            child: Container(
              height: 64,
              padding: EdgeInsets.only(left:12.0),
              child: TextField(
                decoration:
                    InputDecoration(labelText: "Looking for something?"),
              ),
            ),
          );
        } else if (index == 3) {
          return Container(
            padding: EdgeInsets.only(top: 8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: () {
//                Navigator.of(context).pushNamed("");
              },
              padding: EdgeInsets.all(12),
              color: Colors.pinkAccent,
              child: Text('Search', style: TextStyle(color: Colors.white)),
            ),
          );
        }
      }),
    );
  }
}

List<Widget> buildPromotionListWidget() {
  List<Widget> promotionListWidget = List();
  int n = 10;
  for (int i = 0; i < n; i++) {
    promotionListWidget.add(
      SizedBox(
        child: Card(
          elevation: 3.0,
          child: Text(""),
        ),
      ),
    );
  }
  return promotionListWidget;
}
