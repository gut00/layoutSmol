import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/item_cart_model.dart';

class flag extends StatelessWidget {
  const flag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: const Color.fromARGB(255, 255, 255, 67),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Adicionais',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(200, 24, 131, 61),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 80),
            child: Text(
              'escolha até 3 itens',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(200, 24, 131, 61),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              width: 60,
              height: 15,
              child: const Center(
                child: Text(
                  'Obrigatorio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
