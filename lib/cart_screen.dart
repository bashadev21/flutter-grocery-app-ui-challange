import 'package:ecommerceapp_ui_challange/home_bloc.dart';
import 'package:ecommerceapp_ui_challange/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final DummyConttroller _conttroller = Get.find();
  @override
  Widget build(BuildContext context) {
    final bloc = ProductProvider.of(context)!.bloc;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GetBuilder<DummyConttroller>(
                        builder: (value) => ListView.builder(
                            itemCount: value.cart.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          value.cart[index].product.image),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    value.cart[index].qty.toString() + ' x',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    value.cart[index].product.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$' +
                                        (double.parse(value.cart[index].product
                                                    .price) *
                                                value.cart[index].qty)
                                            .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // IconButton(
                                  //     onPressed: () {
                                  //       _conttroller.totalprice.value;
                                  //       _conttroller
                                  //           .deleteproduct(value.cart[index]);
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.delete,
                                  //       color: Colors.grey[50],
                                  //     ))
                                ],
                              );
                            }),
                      ))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text(
                'Total',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Obx(
                () => Text(
                  '\$' + _conttroller.totalprice.value.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 15),
            onPressed: () {},
            color: const Color(0xFFF4C459),
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: cartbarheifght,
        )
      ],
    );
  }
}
