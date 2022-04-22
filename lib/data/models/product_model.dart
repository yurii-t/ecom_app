// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// class ProductModel extends Equatable {
//   final String name;
//   final String imageUrl;
//   final String category;
//   final double price;
//   final bool isFavorite;
//   final bool isFeatured;

//   ProductModel({
//     required this.name,
//     required this.imageUrl,
//     required this.category,
//     required this.price,
//     required this.isFavorite,
//     required this.isFeatured,
//   });

//   static fromSnapShot(DocumentSnapshot snap) {
//     ProductModel product = ProductModel(
//         name: snap['name'],
//         imageUrl: snap['imageUrl'],
//         category: snap['category'],
//         price: snap['price'],
//         isFavorite: snap['isFavorite'],
//         isFeatured: snap['isFeatured']);
//     return product;
//   }

//   @override
//   List<Object?> get props => [
//         name,
//         imageUrl,
//         category,
//         price,
//         isFavorite,
//         isFeatured,
//       ];
// }
