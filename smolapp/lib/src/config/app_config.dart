import '../models/item_cart_model.dart';
import '../models/item_model.dart';

ItemModel bombom = ItemModel(
  itemQuant: 0,
  itemName: 'bombom',
  price: 4.50,
);

ItemModel morango = ItemModel(
  itemQuant: 0,
  itemName: 'Morango   ',
  price: 1.25,
);

ItemModel granulado = ItemModel(
  itemQuant: 0,
  itemName: 'Granulado',
  price: 1.25,
);

ItemModel ninho = ItemModel(
  itemQuant: 0,
  itemName: 'Ninho        ',
  price: 1.25,
);

// Lista de produtos
List<ItemModel> items = [
  ninho,
  granulado,
  morango,
  bombom,
];

List<CartItemModel> cartItem = [
  CartItemModel(
    item: bombom,
    quantity: 1,
    price: 4.50,
  ),
  CartItemModel(
    item: morango,
    quantity: 1,
    price: 1.25,
  ),
  CartItemModel(
    item: granulado,
    quantity: 1,
    price: 1.25,
  ),
  CartItemModel(
    item: ninho,
    quantity: 1,
    price: 1.25,
  ),
];
