import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Cart extends Equatable {
  final String name;
  final String imageUrl;
  final String colors;
  final String sizes;
  final num price;
  final int quantity;

  const Cart({
    required this.name,
    required this.imageUrl,
    required this.colors,
    required this.sizes,
    required this.price,
    required this.quantity,
  });

  static Cart fromSnapShot(DocumentSnapshot snap) {
    Cart cart = Cart(
      name: snap['name'] as String,
      imageUrl: snap['imageUrl'] as String,
      price: snap['price'] as num,
      quantity: snap['quantity'] as int,
      sizes: snap['sizes'] as String,
      colors: snap['colors'] as String,
    );
    return cart;
  }

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        price,
        quantity,
        sizes,
        colors,
      ];
}