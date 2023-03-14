import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:smolapp/src/config/app_config.dart';
import 'package:smolapp/src/models/item_cart_model.dart';
import 'package:smolapp/src/pages/common_widget/dropbox.dart';
import 'package:smolapp/src/pages/common_widget/final_quantity_widget.dart';
import 'package:smolapp/src/pages/components/item_tile.dart';
import 'package:smolapp/src/services/utils_services.dart';
import 'package:quickalert/quickalert.dart';

import '../components/flag.dart';

class Productpage extends StatefulWidget {
  const Productpage({
    super.key,
  });

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  String bombomPrice = 'R\$ 4,50';
  final UtilServices utilServices = UtilServices();

  void showAlertS() {
    QuickAlert.show(
      context: context,
      title: 'Sucesso',
      text: 'Compra finalizada',
      type: QuickAlertType.success,
    );
  }

  void showAlertF() {
    QuickAlert.show(
      context: context,
      title: 'Atenção',
      text: 'adicione 3 itens obrigatorios',
      type: QuickAlertType.warning,
    );
  }

  int totalQuantity = 1;

  double cartTotalPrice() {
    double total = 0;
    for (var item in cartItem) {
      total += item.totalPrice(totalQuantity);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar ----
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: const Color.fromARGB(200, 255, 255, 67),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 22),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: Color.fromARGB(200, 32, 171, 78),
            ),
          ),
          const Icon(
            Icons.place_rounded,
            color: Color.fromARGB(200, 32, 171, 78),
            size: 16,
          ),
          const dropbox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Color.fromARGB(200, 32, 171, 78),
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //logo e background
          Stack(
            children: [
              Container(
                color: Colors.white,
                height: 120,
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/img/backgroundChoc.png",
                      ),
                      fit: BoxFit.cover),
                ),
                height: 96,
              ),
              Positioned(
                top: 20,
                left: 137,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/img/logo.png",
                      ),
                    ),
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 242, 220, 158),
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
          // corpo - imagem do produto
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 330,
              height: 220,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/img/bombom.png",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // container - info e botão de like
          Container(
            width: 330,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border.all(
                color: const Color.fromARGB(200, 48, 252, 111),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Bombom 1',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              bombomPrice,
                              style: const TextStyle(
                                color: Color.fromARGB(200, 40, 212, 94),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Doce de Chocolate',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: LikeButton(
                        size: 30,
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Color.fromARGB(200, 24, 131, 61),
                          dotSecondaryColor: Color.fromARGB(255, 255, 255, 67),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // tarja amarela
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: flag(),
          ),
          //item------------------------------------------------------------
          Stack(
            children: [
              ItemTile(
                sizetile: 123,
                cartItem: CartItemModel(
                  price: 1.25,
                  item: morango,
                  quantity: 0,
                ),
              ),
              ItemTile(
                sizetile: 82,
                cartItem: CartItemModel(
                  price: 1.25,
                  item: ninho,
                  quantity: 0,
                ),
              ),
              ItemTile(
                sizetile: 41,
                cartItem: CartItemModel(
                  price: 1.25,
                  item: granulado,
                  quantity: 0,
                ),
              ),
            ],
          ),
          //rodapé - total
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40, 212, 94),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: finalQuantity(
                        color: const Color.fromARGB(255, 32, 171, 78),
                        value: totalQuantity,
                        result: (quantity) {
                          setState(() {
                            totalQuantity = quantity;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 40),
                    child: Text(
                      utilServices.priceToCurrenty(cartTotalPrice()),
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 25,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(200, 24, 131, 61),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        if (cartTotalPrice() < 1) {
                          showAlertS();
                        } else {
                          showAlertF();
                        }
                      },
                      child: const Text(
                        'Adicionar',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
