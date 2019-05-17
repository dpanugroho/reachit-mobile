class Item {
  final String name;
  final double quantity;
  final double price;

  Item(this.name, this.quantity, this.price);

  Item.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        quantity = json['quantity'],
        price = json['price'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'quantity': quantity,
        'price' : price,
      };
}