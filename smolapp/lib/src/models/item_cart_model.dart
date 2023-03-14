import 'package:smolapp/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;
  double price;

  CartItemModel({
    required this.price,
    required this.item,
    required this.quantity,
  });

  double totalPrice(int quantity) {
    if (quantity > 1) {
      return item.price * quantity;
    } else {
      return item.price;
    }
  }
}
