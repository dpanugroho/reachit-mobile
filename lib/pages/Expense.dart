import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reachit/models/item.dart';

class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String responseString =
    """
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
              "created_at": "2019-05-15T12:36:12.215000",
              "last_modified_at": "2019-05-15T12:36:12.216000",
              "id": "5cdc07bc6136df871f303bb4"
          },
          {
              "items": [
                  {
                      "name": "Strawberry",
                      "price": 1.99,
                      "quantity": 1.0
                  },
                  {
                      "name": "Coffee",
                      "price": 0.49,
                      "quantity": 1.0
                  }
              ],
              "created_at": "2019-05-15T12:38:00.657000",
              "last_modified_at": "2019-05-15T12:38:00.657000",
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
          }
      ]
  }
  """;
    Map<String, dynamic> jsonResponse = jsonDecode(responseString);
//    final List<ListItem> items = new List();
    final List listItems = new List();
    List transactions =  jsonResponse['transactions'];
    for(int i=0; i<transactions.length; i++){
      List transactionItems = transactions[i]['items'];
      DateTime parsedDate = DateTime.parse(transactions[i]['last_modified_at']);
      listItems.add(parsedDate.toLocal());
      for(int j=0; j<transactionItems.length; j++){
        Map currentItemMap = transactionItems[j];
        var currentItem = new Item.fromJson(currentItemMap);
        listItems.add(currentItem);
      }
    }
    return ListView.builder(

      // Let the ListView know how many items it needs to build
      itemCount: listItems.length,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = listItems[index];
        if (item is DateTime) {
          print(item);
          return ListTile(
            title: Text(
              item.toString(),
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is Item) {
          return ListTile(
            title: Text(item.name),
            subtitle: Text('You can save € 5'),
            trailing: Text(item.price.toString()),
          );
        }
      },
    );
  }


  Widget buildListItem(item) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("${item['name']} (${item['qty']})",
              style: TextStyle(
                  color: Colors.black
              )),
          Text("€ ${item['price']}",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              )),
        ],
      ),
      padding: EdgeInsets.all(10.0),
    );
  }
}