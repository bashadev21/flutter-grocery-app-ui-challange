import 'package:ecommerceapp_ui_challange/product_list.dart';
import 'package:ecommerceapp_ui_challange/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'appbar.dart';
import 'cart_screen.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final bloc = HomeBloc();
const bgcolor = Color(0xFFF6F5F2);
const cartbarheifght = 100.0;
const panelduration = Duration(milliseconds: 500);

void onverticalup(DragUpdateDetails details) {
  if (details.primaryDelta! < -7) {
    bloc.changetocart();
  } else if (details.primaryDelta! > 12) {
    bloc.changetonormal();
  }
}

double? gettopcrtbox(GroceryState state, Size size) {
  if (state == GroceryState.normal) {
    return -cartbarheifght + kToolbarHeight;
  } else if (state == GroceryState.cart) {
    return -(size.height - kToolbarHeight - cartbarheifght / 2);
  }
  return 0.0;
}

double? gettoblacktbox(GroceryState state, Size size) {
  if (state == GroceryState.normal) {
    return size.height - cartbarheifght;
  } else if (state == GroceryState.cart) {
    return cartbarheifght / 2;
  }
  return 0.0;
}

double? gettoappbar(
  GroceryState state,
) {
  if (state == GroceryState.normal) {
    return 0.0;
  } else if (state == GroceryState.cart) {
    return -cartbarheifght;
  }
  return 0.0;
}

class _HomePageState extends State<HomePage> {
  final DummyConttroller _conttroller = Get.put(DummyConttroller());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ProductProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Stack(
                  children: [
                    AnimatedPositioned(
                        curve: Curves.decelerate,
                        duration: panelduration,
                        top: gettopcrtbox(bloc.grocerystate, size),
                        right: 0,
                        left: 0,
                        height: size.height - kToolbarHeight,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: bgcolor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ProductList(),
                          ),
                        )),
                    AnimatedPositioned(
                        curve: Curves.decelerate,
                        duration: panelduration,
                        top: gettoblacktbox(bloc.grocerystate, size),
                        right: 0,
                        left: 0,
                        height: size.height,
                        child: GestureDetector(
                          onVerticalDragUpdate: onverticalup,
                          child: Container(
                            color: Colors.black,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: AnimatedSwitcher(
                                      duration: panelduration,
                                      child: bloc.grocerystate ==
                                              GroceryState.normal
                                          ? Row(children: [
                                              const Text(
                                                'Cart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Expanded(
                                                  child: SingleChildScrollView(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: GetBuilder<
                                                    DummyConttroller>(
                                                  builder: (value) => Row(
                                                      children: List.generate(
                                                    value.cart.length,
                                                    (index) => Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      child: Stack(
                                                        children: [
                                                          Hero(
                                                            tag: value
                                                                    .cart[index]
                                                                    .product
                                                                    .image +
                                                                'backtohome',
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              backgroundImage:
                                                                  AssetImage(value
                                                                      .cart[
                                                                          index]
                                                                      .product
                                                                      .image),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 0,
                                                            child: CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              child: Text(
                                                                value
                                                                    .cart[index]
                                                                    .qty
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                ),
                                              )),
                                              // Obx(() => CircleAvatar(
                                              //       backgroundColor:
                                              //           const Color(0xFFF4C459),
                                              //       child: Text(
                                              //         _conttroller.cartcount.toString(),
                                              //         style: const TextStyle(
                                              //             color: Colors.black,
                                              //             fontSize: 20,
                                              //             fontWeight: FontWeight.w500),
                                              //       ),
                                              //     ))
                                              GetBuilder<DummyConttroller>(
                                                  builder: (value) =>
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFF4C459),
                                                        child: Text(
                                                          value.cart.length
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ))
                                            ])
                                          : const SizedBox.shrink()),
                                ),
                                const Expanded(child: CartScreen()),
                                // Container(
                                //     height: 400,
                                //     color: Colors.grey,
                                //     child: GetBuilder<DummyConttroller>(
                                //       builder: (value) => ListView.builder(
                                //           shrinkWrap: true,
                                //           itemCount: value.cart.length,
                                //           itemBuilder: (context, index) {
                                //             return Text(
                                //               value.cart[index].product.name,
                                //               style: TextStyle(
                                //                   color: Colors.white),
                                //             );
                                //           }),
                                //     ))
                              ],
                            ),
                          ),
                        )),
                    AnimatedPositioned(
                        curve: Curves.decelerate,
                        duration: panelduration,
                        left: 0,
                        right: 0,
                        top: gettoappbar(bloc.grocerystate),
                        child: const AppbarWidget()),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
