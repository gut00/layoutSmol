import 'package:flutter/material.dart';
import 'package:smolapp/src/models/item_cart_model.dart';
import 'package:smolapp/src/services/utils_services.dart';
import '../common_widget/quantity_widget.dart';

class ItemTile extends StatefulWidget {

  final CartItemModel cartItem;
  final double sizetile;

  const ItemTile({
    required this.sizetile,
    required this.cartItem,
    super.key,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {

  final UtilServices utilServices = UtilServices();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        height: widget.sizetile,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
          ),
          border: Border.all(
            color: const Color.fromARGB(200, 48, 252, 111),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                widget.cartItem.item.itemName,
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            // valor do item ------------------
            Padding(
              padding: const EdgeInsets.only(left: 90, bottom: 10),
              child: Text(
                utilServices.priceToCurrenty(
                    widget.cartItem.totalPrice(widget.cartItem.quantity)),
                style: TextStyle(
                  color: widget.cartItem.quantity > 0
                      ? const Color.fromARGB(200, 40, 212, 94)
                      : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // widget quantidade ----------------------
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 15),
              child: QuatityWidget(
                color: const Color.fromARGB(200, 40, 212, 64),
                value: widget.cartItem.quantity,
                result: (quantity) {
                  setState(() {
                    widget.cartItem.quantity = quantity;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
