import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/data/models/product.dart';

import 'package:ecom_app/ui/widgets/item_container.dart';

import 'package:flutter/material.dart';

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
              ? const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.docs.length,
                  shrinkWrap: true,
                  itemExtent: 183,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot? data = snapshot.data?.docs[index];
                    final String productId = data?.id ?? '';
                    List<Product> favprod = [];
                    return ItemContainer(
                      product: favprod[index],
                      updateFavorite: () {},
                    );
                    // return ItemContainer(data: data, productId: productId);
                  },
                );
        },
      ),
    );
  }
}
