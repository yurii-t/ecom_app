import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_screen.dart';
import 'package:ecom_app/ui/widgets/item_container.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:ecom_app/ui/widgets/star_icon_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemGridView extends StatelessWidget {
  final Stream<QuerySnapshot> collectRef;
  final Axis scrollDirections;
  // final int itemCount;
  // final String name;
  // final String image;
  // final String productId;
  // final num price;
  // final bool isFavorite;
  const ItemGridView({
    required this.collectRef,
    required this.scrollDirections,
    // required this.image,
    // required this.productId,
    // required this.price,
    // required this.isFavorite,
    Key? key,
  }) : super(key: key);

  // bool favorite = false;
  // int value = 0;
  // CollectionReference products =
  //     FirebaseFirestore.instance.collection('products');
  // num val = 1;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          collectRef, //FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                ),
              )
            : GridView.builder(
                scrollDirection: scrollDirections,
                itemCount: snapshot.data?.docs.length, //6,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 3
                      : 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 260,
                  childAspectRatio: 2 / 2,
                ),
                itemBuilder: (context, index) {
                  final DocumentSnapshot? data = snapshot.data?.docs[index];
                  final String productId = data?.id ?? '';

                  return ItemContainer(data: data, productId: productId);
                },
              );
      },
    );
  }
}
