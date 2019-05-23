import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reachit/commons/ui.dart';
import 'package:reachit/models/Items.dart';
import 'package:reachit/models/item.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: FutureBuilder(
            future: getCurrentUserTransaction(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text(
                      "Loading..",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else {
                var transactions = snapshot.data;
                return ListView.builder(
                    itemCount: snapshot.data.length,

                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return buildLogo();
                      } else if (index == 1) {
                        return _buildCard();
                      } else if (index == 2) {
                        return _buildCardTwo();
                      } else {
                        var currentRow = transactions[index];
                        if (currentRow.item1 == "date") {


                          return Text(
                            getDateToShow(currentRow.item2),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w100),
                          );
                        }
                        else if (currentRow.item1 == "items") {
                          print(currentRow.item2);
                          List<Widget> currentTransactionItemWidget =
                              new List();
                          for (int j = 0;
                              j < currentRow.item2.length;
                              j++) {
                            Map currentItemMap = currentRow.item2[j];
                            var currentItem = new Item.fromJson(currentItemMap);
                            currentTransactionItemWidget
                                .add(_buildItem(currentItem));
                          }
                          return Column(
                            children: currentTransactionItemWidget,
                          );
                        }
                      }
                    });
              }
            }),
      ),
    );
  }
}

Widget _buildCardTwo() {
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
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        'You can save € 2!',
        style: TextStyle(color: Colors.yellow, fontSize: 14),
      ),
      trailing: Text(
        "€ " + item.price.toString(),
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );

Widget _buildCard() {
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
  var nameController = new TextEditingController();
  var priceController = new TextEditingController();
  var quantityController = new TextEditingController();

  Future<http.Response> _postNewItems(Items addedItems) async {
    final prefs = await SharedPreferences.getInstance();
    var url = 'https://reachit-api.herokuapp.com/users/me/transactions';
    String auth = 'Bearer ' + prefs.get("accessToken");

    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: auth
        },
        body: jsonEncode(addedItems));
    Map<String, dynamic> jsonResponseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    } else {
      showErrorDialog(context, jsonResponseBody['message']);
    }
    return response;
  }

  return new AlertDialog(
    title: const Text('Add new expense'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'Name'),
          controller: nameController,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Quantity'),
          controller: quantityController,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Price (total)'),
          controller: priceController,
        ),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          if (nameController.text.length != 0 &&
              quantityController.text.length != 0 &&
              priceController.text.length != 0) {
            Item addedItem = new Item(
                nameController.text,
                double.parse(quantityController.text),
                double.parse(priceController.text));
            List<Item> itemList = new List();
            itemList.add(addedItem);
            Items addedItems = new Items(itemList);
            _postNewItems(addedItems);

            Navigator.of(context).pop();
          } else {
            showErrorDialog(context, "All filed must be filled in");
          }
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Add it!'),
      ),
    ],
  );
}

Future<List> getCurrentUserTransaction() async {
  final prefs = await SharedPreferences.getInstance();
  var url = 'https://reachit-api.herokuapp.com/users/me/transactions';
  String auth = 'Bearer ' + prefs.get("accessToken");

  var response =
      await http.get(url, headers: {HttpHeaders.authorizationHeader: auth});
  var jsonResponse = jsonDecode(response.body)['transactions'];

  DateTime latestTransactionDate =
      DateTime.parse(jsonResponse[0]['last_modified_at']).toLocal();
  List currentDateItems = [];
  List dayGroupedTransaction = [];

  for (var t in jsonResponse) {
    DateTime currentTransactionDate =
        DateTime.parse(t['last_modified_at']).toLocal();
    if (latestTransactionDate.difference(currentTransactionDate).inDays != 0) {
      dayGroupedTransaction
          .add(Tuple2<String, List>('items', currentDateItems));
      dayGroupedTransaction
          .add(Tuple2<String, DateTime>('date', latestTransactionDate));
      currentDateItems = [];
      latestTransactionDate = currentTransactionDate;
    }
    for (var item in t['items']) {
      currentDateItems.add(item);
    }
  }
  dayGroupedTransaction.add(Tuple2<String, List>('items', currentDateItems));
  dayGroupedTransaction
      .add(Tuple2<String, DateTime>('date', latestTransactionDate));
  dayGroupedTransaction.add(2);
  dayGroupedTransaction.add(1);
  dayGroupedTransaction.add(0);
  return dayGroupedTransaction.reversed.toList();
}

String getDateToShow(DateTime date) {
  String dateToShow = DateFormat('EEEE, MMM dd yyyy').format(date);
  DateTime now = new DateTime.now();
  var dateDifference = now.difference(date).inDays;
  if (dateDifference == 0) {
    dateToShow = "Today";
  } else if (dateDifference == 1) {
    dateToShow = "Yesterday";
  }
  return dateToShow;
}
