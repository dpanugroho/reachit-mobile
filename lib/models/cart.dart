import 'item.dart';
class Cart {
  final String userid;
  final List<Item> items;

  Cart(this.userid, this.items);

  Cart.fromJson(Map<String, dynamic> json)
      : userid = json['userid'],
        items = json['items'];

  Map<String, dynamic> toJson() =>
      {
        'userid': userid,
        'items': items,
      };
}