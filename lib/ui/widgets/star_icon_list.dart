import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarIconList extends StatelessWidget {
  final String productId;

  const StarIconList({
    required this.productId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .collection('reviews')
          .get(),
      builder: (context, snapshot) {
        final List<DocumentSnapshot>? data = snapshot.data?.docs;
        final int? value = data?.fold<num>(
          0,
          (previousValue, element) {
            return previousValue +
                (element['rating'] as num) / (snapshot.data?.docs.length ?? 1);
          },
        ).toInt();

        return !snapshot.hasData
            ? SvgPicture.asset(
                'assets/icons/star.svg',
                color: Colors.grey,
              )
            : Row(
                children: List.generate(5, (index) {
                  return index < (value?.toInt() ?? 1)
                      ? SvgPicture.asset(
                          'assets/icons/star.svg',
                        )
                      : SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: Colors.grey,
                        );
                }),
              );
      },
    );
  }
}
