import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Catalogue extends Equatable {
  final String title;
  final String imageUrl;

  const Catalogue({
    required this.title,
    required this.imageUrl,
  });

  static Catalogue fromSnapShot(DocumentSnapshot snap) {
    Catalogue catalogue = Catalogue(
      title: snap['title'] as String,
      imageUrl: snap['imageUrl'] as String,
    );
    return catalogue;
  }

  @override
  List<Object?> get props => [
        title,
        imageUrl,
      ];
}
