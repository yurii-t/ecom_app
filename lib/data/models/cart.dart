import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String colors;
  final String sizes;
  final num price;
  final int quantity;

  const Cart({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.colors,
    required this.sizes,
    required this.price,
    required this.quantity,
  });

  factory Cart.fromSnapShot(DocumentSnapshot snap) {
    final Cart cart = Cart(
      id: snap.id,
      name: snap['name'] as String,
      imageUrl: snap['imageUrl'] as String,
      price: snap['price'] as num,
      quantity: snap['quantity'] as int,
      sizes: snap['sizes'] as String,
      colors: snap['colors'] as String,
    );

    return cart;
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'colors': colors,
      'sizes': sizes,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        price,
        quantity,
        sizes,
        colors,
      ];
}
