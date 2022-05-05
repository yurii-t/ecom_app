import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecom_app/style/app_gradient.dart';

import 'package:ecom_app/ui/product_page/product_page_screen/product_screen.dart';
import 'package:ecom_app/ui/widgets/item_container.dart';
import 'package:ecom_app/ui/widgets/star_icon_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsRelatedList extends StatelessWidget {
  const ProductsRelatedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 267,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const CircularProgressIndicator()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.docs.length,
                  shrinkWrap: true,
                  itemExtent: 183,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot? data = snapshot.data?.docs[index];
                    final String productId = data?.id ?? '';

                    return ItemContainer(data: data, productId: productId);
                  },
                );
        },
      ),
    );
  }
}
