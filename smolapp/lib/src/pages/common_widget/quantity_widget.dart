import 'package:flutter/material.dart';
import 'package:smolapp/src/models/item_model.dart';

class QuatityWidget extends StatelessWidget {
  final Color color;
  final int value;
  final Function(int quantity) result;
  final bool isZero;

  const QuatityWidget({
    required this.color,
    required this.value,
    required this.result,
    this.isZero = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          border: Border.all(
            color: !isZero || value >= 1
                ? const Color.fromARGB(200, 40, 212, 64)
                : Colors.white,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.6),
          boxShadow: [
            BoxShadow(
              blurRadius: !isZero || value >= 1 ? 2 : 0,
              color: Colors.grey.shade500,
            ),
          ]),
      child: Row(
        children: [
          _QuantityButton(
            icon: Icons.remove,
            color: !isZero || value >= 1 ? color : Colors.white,
            onPressed: () {
              if (value == 0) return;
              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              '$value',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: !isZero || value >= 1
                    ? const Color.fromARGB(200, 40, 212, 64)
                    : Colors.white,
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: color,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    required this.color,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Ink(
          height: 15,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
