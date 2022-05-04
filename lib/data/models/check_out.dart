import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CheckOut extends Equatable {
  final String customerName;
  final String address;
  final String cardNumber;
  final num totalPrice;
  final int delivery;

  const CheckOut({
    required this.customerName,
    required this.address,
    required this.totalPrice,
    required this.delivery,
    required this.cardNumber,
  });

  static CheckOut fromSnapShot(DocumentSnapshot snap) {
    CheckOut checkOut = CheckOut(
      customerName: snap['CustomerName'] as String,
      cardNumber: snap['cardNumber'] as String,
      address: snap['address'] as String,
      totalPrice: snap['price'] as num,
      delivery: snap['delivery'] as int,
    );
    return checkOut;
  }

  @override
  List<Object?> get props => [
        customerName,
        cardNumber,
        address,
        totalPrice,
        delivery,
      ];
}
