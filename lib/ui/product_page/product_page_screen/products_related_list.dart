import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsRelatedList extends StatefulWidget {
  const ProductsRelatedList({Key? key}) : super(key: key);

  @override
  State<ProductsRelatedList> createState() => _ProductsRelatedListState();
}

class _ProductsRelatedListState extends State<ProductsRelatedList> {
  bool favorite = false;
  var _icon = SvgPicture.asset(
    'assets/icons/heart11.svg',
  );
  var _iconStar = SvgPicture.asset(
    'assets/icons/star.svg',
  );

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
                    DocumentSnapshot? data = snapshot.data?.docs[index];
                    String productId = data?.id ?? '';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => ProductPageScreen(
                              productId: productId,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 163,
                                  height: 163,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        data?['imageUrl'].toString() ?? '',
                                      ),
                                      // AssetImage(
                                      //   'assets/images/img_content.png',
                                      // ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  child: Container(
                                    width: 47,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),
                                      gradient: AppGradient.orangeGradient,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '-50%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 145,
                                  //right: 0,
                                  left: 110,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: const CircleBorder(),
                                      // padding: EdgeInsets.all(36),
                                    ),
                                    onPressed: () async {
                                      print('tap');
                                      setState(() {
                                        favorite = !favorite;
                                      });

                                      await data?.reference.update({
                                        'isFavorite': favorite,
                                      }).then(
                                        (value) => print('updated'),
                                      );
                                    },
                                    child: data?['isFavorite'] == true
                                        ? SvgPicture.asset(
                                            'assets/icons/favorite_heart.svg',
                                          )
                                        : SvgPicture.asset(
                                            'assets/icons/heart11.svg',
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _iconStar,
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    _iconStar,
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    _iconStar,
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    _iconStar,
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    _iconStar,
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  data?['name'].toString() ?? 'Loading...',
                                  // LocaleKeys.product_title.tr(),
                                  // 'ECOWISH Womens Color Block Striped Draped K kslkfajklsajlk',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  r'$' + '${data?['price']}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
