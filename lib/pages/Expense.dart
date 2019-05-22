import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reachit/commons/ui.dart';
import 'package:reachit/models/item.dart';
import 'package:intl/intl.dart';

class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String responseString = """
  {
      "transactions": [
          {
              "items": [
                  {
                      "name": "Banana",
                      "price": 1.0,
                      "quantity": 10.0
                  },
                                    {
                      "name": "Apple",
                      "price": 2.1,
                      "quantity": 10.0
                  }
              ],
              "created_at": "2019-05-18T12:36:12.215000",
              "last_modified_at": "2019-05-18T12:36:12.216000",
              "id": "5cdc07bc6136df871f303bb4"
          },
          {
              "items": [
                  {
                      "name": "Strawberry",
                      "price": 1.99,
                      "quantity": 1.0
                  }
              ],
              "created_at": "2019-05-17T12:38:00.657000",
              "last_modified_at": "2019-05-17T12:38:00.657000",
              "id": "5cdc0828dcb64c8975a04e0f"
          },
          {
              "items": [
                  {
                      "name": "Orange",
                      "price": 3.0,
                      "quantity": 2.0
                  },
                  {
                      "name": "Tea",
                      "price": 4.49,
                      "quantity": 1.0
                  },
                  {
                      "name": "Bread",
                      "price": 9.99,
                      "quantity": 1.0
                  }
              ],
              "created_at": "2019-05-15T12:42:16.592000",
              "last_modified_at": "2019-05-15T12:42:16.593000",
              "id": "5cdc0928c3cefcb942b4ea14"
          },
          {
              "items": [
                  {
                      "name": "Orange",
                      "price": 3.0,
                      "quantity": 2.0
                  },
                  {
                      "name": "Tea",
                      "price": 4.49,
                      "quantity": 1.0
                  },
                  {
                      "name": "Bread",
                      "price": 9.99,
                      "quantity": 1.0
                  }
              ],
              "created_at": "2019-05-14T12:42:16.592000",
              "last_modified_at": "2019-05-15T12:42:16.593000",
              "id": "5cdc0928c3cefcb942b4ea14"
          },
          {
              "items": [
                  {
                      "name": "Orange",
                      "price": 3.0,
                      "quantity": 2.0
                  },
                  {
                      "name": "Tea",
                      "price": 4.49,
                      "quantity": 1.0
                  },
                  {
                      "name": "Bread",
                      "price": 9.99,
                      "quantity": 1.0
                  }
              ],
              "created_at": "2019-05-11T12:42:16.592000",
              "last_modified_at": "2019-05-15T12:42:16.593000",
              "id": "5cdc0928c3cefcb942b4ea14"
          }
          
      ]
  }
  """;
    Map<String, dynamic> jsonResponse = jsonDecode(responseString);
    List transactions = List();
    transactions.add(0);
    transactions.add(1);
    transactions.add(2);
    transactions.addAll(jsonResponse['transactions']);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildAddExpenseDialog(context),
          );
        },
        child: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
        decoration: createBoxDecoration(),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return buildLogo();
            } else if (index == 1) {
              return _buildCard();
            } else if (index == 2) {
              return _buildCardTwo();
            } else {
              final currentTransaction = transactions[index];
              DateTime parsedDate =
                  DateTime.parse(currentTransaction['last_modified_at']);
              String dateToShow =
                  DateFormat('EEEE, MMM dd yyyy').format(parsedDate);
              DateTime now = new DateTime.now();
              var dateDifference = now.difference(parsedDate).inDays;
              if (dateDifference == 0) {
                dateToShow = "Today";
              } else if (dateDifference == 1) {
                dateToShow = "Yesterday";
              }
              List<Widget> currentTransactionItemWidget = new List();
              for (int j = 0; j < currentTransaction['items'].length; j++) {
                Map currentItemMap = currentTransaction['items'][j];
                var currentItem = new Item.fromJson(currentItemMap);
                currentTransactionItemWidget.add(_buildItem(currentItem));
              }

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateToShow,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w100),
                    ),
                    Column(
                      children: currentTransactionItemWidget,
                    )
                  ]);
            }
          },
        ),
      ),
    );
  }
}

Widget _buildCardTwo() {
  DateTime now = DateTime.now();
  return SizedBox(
    height: 72,
    child: Card(
      elevation: 3.0,
    ),
  );
}

Widget _buildItem(Item item) => ListTile(
      leading: Icon(
        Icons.shopping_basket,
        color: Colors.white,
        size: 24,
      ),
      title: Text(
        item.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        'You can save € 2!',
        style: TextStyle(color: Colors.yellow, fontSize: 14),
      ),
      trailing: Text(
      "€ "+item.price.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );

Widget _buildCard() {
  DateTime now = DateTime.now();
  return Column(
    children: <Widget>[
      SizedBox(
        height: 256,
        child: Card(
          color: Colors.white,
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//            Text(
//              DateFormat('MMM').format(now),
//              style: TextStyle(color: Colors.black54, fontSize: 24),
//            ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildAddExpenseDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Add new expense'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'Name'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Quantity'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Price (total)'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Merchant'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Merchant'),
        ),
//        _buildAboutText(),
//        _buildLogoAttribution(),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Add it!'),
      ),
    ],
  );
}
