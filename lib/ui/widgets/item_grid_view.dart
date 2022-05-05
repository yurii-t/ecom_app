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
            ? const CircularProgressIndicator(
                strokeWidth: 2,
              )
            : GridView.builder(
                scrollDirection: scrollDirections,
                itemCount: snapshot.data?.docs.length, //6,
                // physics: const NeverScrollableScrollPhysics(),
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
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigation.mainAppNav.currentState?.pushNamed(
                  //       '/home_screen/product_screen',
                  //       arguments: productId,
                  //     );
                  //   },
                  //   child: Column(
                  //     children: [
                  //       Stack(
                  //         clipBehavior: Clip.none,
                  //         children: [
                  //           Container(
                  //             width: 163,
                  //             height: 163,
                  //             decoration: BoxDecoration(
                  //               borderRadius: const BorderRadius.all(
                  //                 Radius.circular(8),
                  //               ),
                  //               image: DecorationImage(
                  //                 fit: BoxFit.fill,
                  //                 image: NetworkImage(
                  //                   data?['imageUrl'].toString() ??
                  //                       'Loading...',
                  //                 ),
                  //                 //   AssetImage(
                  //                 // 'assets/images/img_content.png',
                  //               ),
                  //             ),
                  //           ),
                  //           Positioned(
                  //             top: 8,
                  //             child: Container(
                  //               width: 47,
                  //               height: 20,
                  //               decoration: const BoxDecoration(
                  //                 borderRadius: BorderRadius.only(
                  //                   topRight: Radius.circular(40),
                  //                   bottomRight: Radius.circular(40),
                  //                 ),
                  //                 gradient: AppGradient.orangeGradient,
                  //               ),
                  //               child: const Center(
                  //                 child: Text(
                  //                   '-50%',
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 11,
                  //                     fontWeight: FontWeight.w700,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Positioned(
                  //             top: 145,
                  //             //right: 0,
                  //             left: 110,
                  //             child: ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                 primary: Colors.white,
                  //                 shape: const CircleBorder(),
                  //               ),
                  //               onPressed: () async {
                  //                 print('tap');

                  //                 final bool isFavorite =
                  //                     data?['isFavorite'] as bool;

                  //                 await data?.reference.update({
                  //                   'isFavorite': !isFavorite,
                  //                 }).then(
                  //                   (value) => print('updated'),
                  //                 );
                  //               },
                  //               child: data?['isFavorite'] == true
                  //                   ? SvgPicture.asset(
                  //                       'assets/icons/favorite_heart.svg',
                  //                     )
                  //                   : SvgPicture.asset(
                  //                       'assets/icons/heart11.svg',
                  //                     ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       const SizedBox(
                  //         height: 8,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 16),
                  //         child: Column(
                  //           // mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             StarIconList(
                  //               productId: productId,
                  //             ),
                  //             const SizedBox(
                  //               height: 8,
                  //             ),
                  //             Text(
                  //               data?['name'].toString() ?? 'Loading',
                  //               //LocaleKeys.product_title.tr(),
                  //               // 'ECOWISH Womens Color Block Striped Draped K kslkfajklsajlk',
                  //               overflow: TextOverflow.ellipsis,
                  //               maxLines: 2,
                  //               style: const TextStyle(
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Colors.black,
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 8,
                  //             ),
                  //             Text(
                  //               r'$' + '${data?['price']}',
                  //               style: const TextStyle(
                  //                 fontSize: 17,
                  //                 fontWeight: FontWeight.w700,
                  //                 color: Colors.black,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
              );
      },
    );
  }
}
