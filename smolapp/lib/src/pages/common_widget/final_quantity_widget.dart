import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class finalQuantity extends StatelessWidget {
  final Color color;
  final int value;
  final Function(int quantity) result;

  const finalQuantity({
    super.key,
    required this.value,
    required this.result,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuantityFinalButton(
          icon: Icons.remove_circle,
          color: color,
          onPressed: () {
            if (value == 1) return;
            int resultCount = value - 1;
            result(resultCount);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '$value',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        _QuantityFinalButton(
          icon: Icons.add_circle,
          color: color,
          onPressed: () {
            int resultCount = value + 1;
            result(resultCount);
          },
        ),
      ],
    );
  }
}

class _QuantityFinalButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityFinalButton({
    required this.color,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          color: color,
          size: 18,
        ),
      ),
    );
  }
}
