import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body:Center(
          child:Text('Cart')
        )
      )
    );
  }
}