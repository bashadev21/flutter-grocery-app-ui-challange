import 'package:ecommerceapp_ui_challange/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_bloc.dart';

class ProductDetails extends StatefulWidget {
  final VoidCallback? onProductAdd;
  const ProductDetails({Key? key, required this.product, this.onProductAdd})
      : super(key: key);
  final Products product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final DummyConttroller _conttroller = Get.find();
  String herotag = '';
  void addtocart(BuildContext context) {
    setState(() {
      herotag = 'backtohome';
      _conttroller.addproduct(widget.product);
      Navigator.pop(context);
    });
  }

  final bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  height: 250,
                  child: Hero(
                      tag: widget.product.image + herotag,
                      child: Center(child: Image.asset(widget.product.image))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.product.name,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(23)),
                      height: 35,
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.remove),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Icon(Icons.add)
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$' + widget.product.price + '.00',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'About the Product',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        )),
                  ),
                  // ignore: deprecated_member_use
                  Expanded(
                      flex: 8,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        onPressed: () => addtocart(context),
                        color: const Color(0xFFF4C459),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
