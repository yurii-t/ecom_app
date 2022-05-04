import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String name;
  final String imageUrl;
  final String description;
  final String category;
  final num price;
  final bool isFavorite;
  final bool isFeatured;
  final bool inStock;
  final List img;

  const Product({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.isFavorite,
    required this.isFeatured,
    required this.description,
    required this.inStock,
    required this.img,
  });

  static Product fromSnapShot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'] as String,
      imageUrl: snap['imageUrl'] as String,
      category: snap['category'] as String,
      price: snap['price'] as num,
      isFavorite: snap['isFavorite'] as bool,
      isFeatured: snap['isFeatured'] as bool,
      inStock: snap['inStock'] as bool,
      img: snap['img'] as List,
      description: snap['description'] as String,
    );
    return product;
  }

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        category,
        price,
        isFavorite,
        isFeatured,
        inStock,
        description,
        img,
      ];
}
