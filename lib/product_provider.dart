import 'package:ecommerceapp_ui_challange/home_bloc.dart';
import 'package:flutter/material.dart';

class ProductProvider extends InheritedWidget {
  final HomeBloc bloc;
  final Widget child;

  ProductProvider({required this.bloc, required this.child})
      : super(child: child);
  static ProductProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProductProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
