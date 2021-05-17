import 'package:ecommerceapp_ui_challange/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum GroceryState { normal, details, cart }

class HomeBloc with ChangeNotifier {
  List<Products> product = List.unmodifiable(proucts);
  List<PoductsCart> cart = [];
  GroceryState grocerystate = GroceryState.normal;
  void changetonormal() {
    grocerystate = GroceryState.normal;
    notifyListeners();
  }

  void changetocart() {
    grocerystate = GroceryState.cart;
    notifyListeners();
  }

  void addproduct(Products product) {
    cart.add(PoductsCart(product: product));

    notifyListeners();
    notifyListeners();
  }
}

class DummyConttroller extends GetxController {
  var cartcount = 0.obs;
  var totalprice = 0.0.obs;
  List<PoductsCart> cart = [];

  void deleteproduct(PoductsCart productitm) {
    cart.remove(productitm);

    update();
  }

  void addproduct(Products product) {
    for (PoductsCart item in cart) {
      if (item.product.name == product.name) {
        item.add();
        update();
        return;
      }
    }
    cart.add(PoductsCart(product: product));
    int totalelemts() => cart.fold<int>(
        0, (previousValue, element) => previousValue + element.qty);
    cartcount.value = totalelemts();

    double totoalprice() => cart.fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue +
            (element.qty * double.parse(element.product.price)));
    totalprice.value = totoalprice();
    update();
  }
}

class PoductsCart {
  PoductsCart({this.qty = 1, required this.product});
  int qty;
  final Products product;

  void add() {
    qty++;
  }

  void subtract() {}
}
