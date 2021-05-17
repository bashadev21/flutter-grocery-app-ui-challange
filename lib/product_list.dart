import 'package:ecommerceapp_ui_challange/product_provider.dart';
import 'package:ecommerceapp_ui_challange/products_details.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = ProductProvider.of(context)!.bloc;

    return GridView.builder(
        padding: const EdgeInsets.only(top: cartbarheifght),
        itemCount: bloc.product.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          final product = bloc.product[index];
          return Transform.translate(
            offset: Offset(0.0, index.isOdd ? 85 : 0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 900),
                        pageBuilder: (context, animation, ___) {
                          return FadeTransition(
                            opacity: animation,
                            child: ProductDetails(
                                product: product,
                                onProductAdd: () {
                                  bloc.addproduct(product);
                                }),
                          );
                        }));
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Hero(
                            tag: product.image,
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 14),
                            Text('\$ ${bloc.product[index].price}.00',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              bloc.product[index].name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 4),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                    5,
                                    (index) => const Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.yellow,
                                        ))),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
    // return ListView.builder(
    //     padding: const EdgeInsets.only(top: cartbarheifght),
    //     physics: const BouncingScrollPhysics(),
    //     itemCount: bloc.product.length,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         height: 100,
    //         color: Colors.primaries[index % Colors.primaries.length],
    //       );
    //     });
  }
}
