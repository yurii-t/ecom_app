import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

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

  factory CheckOut.fromSnapShot(DocumentSnapshot snap) {
    final CheckOut checkOut = CheckOut(
      customerName: snap['CustomerName'] as String,
      cardNumber: snap['cardNumber'] as String,
      address: snap['address'] as String,
      totalPrice: snap['price'] as num,
      delivery: snap['delivery'] as int,
    );

    return checkOut;
  }
  Map<String, Object> toDocument() {
    return {
      'CustomerName': customerName,
      'cardNumber': cardNumber,
      'address': address,
      'price': totalPrice,
      'delivery': delivery,
    };
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
