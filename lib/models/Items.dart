import 'item.dart';
class Items {
  final List<Item> items;

  Items(this.items);


  Items.fromJson(Map<String, dynamic> json)
      : items = json['items'];

  Map<String, dynamic> toJson() =>
      {
        'items': items,
      };
}