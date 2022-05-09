import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';

import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/add_to_cart_bottom_sheet.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_details_container.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_screen_carousel.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_reviews_container.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/products_related_list.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/widgets/product_color_picker.dart';
import 'package:ecom_app/ui/widgets/size_picker.dart';
import 'package:ecom_app/ui/widgets/star_icon_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatelessWidget {
//  final String productId;
  const ProductScreen({
    //required this.productId,
    Key? key,
  }) : super(key: key);

  // final List<String> imgSlider = [
  //   'assets/images/img_gal.jpg',
  //   'assets/images/product_img1.png',
  //   'assets/images/product_img12.jpg',
  //   'assets/images/content_img1.png',
  // ];

  // var _iconStar = SvgPicture.asset(
  //   'assets/icons/star.svg',
  // );
  // int _sliderProductCurrent = 0;
  // final CarouselController _sliderProductController = CarouselController();
  // bool _isOpen = false;
  // static double _minHeight = 175;
  // final double _maxHeight = 600;

  // void openReview() {
  //   if (!_isOpen) {
  //     setState(() {
  //       _minHeight = _maxHeight;
  //     });
  //   } else {
  //     setState(() {
  //       _minHeight = 175;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String pickedProductColor = '';
    String pickedProductSizes = '';
    // late String dataName;
    // late num dataPrice;
    // late String dataimgUrl;
//  final int _itemCounter = 1;
    final _icon = SvgPicture.asset(
      'assets/icons/heart11.svg',
    );
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        extendBody: false,
        // extendBody: true,
        backgroundColor: AppColors.backGround,
        body: ListView(
          children: [
            //   Column(
            //     children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 708,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ProductScreenCarousel(
                    productId: productId, //widget.productId,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('products')
                        .doc(productId)
                        //.doc(widget.productId)
                        .get(),
                    builder: (context, snapshot) {
                      final DocumentSnapshot? data = snapshot.data;
                      // if (data != null) {
                      // //  String dataName = data['name'].toString();
                      // // final num  dataPrice = data['price'] as num;
                      // //  final String dataimgUrl = data['imageUrl'].toString();
                      //   // review = data['reviews'].toString(),
                      // }

                      return !snapshot.hasData
                          ? const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            StarIconList(
                                              productId: productId,
                                            ),
                                            Text(
                                              '80 ${LocaleKeys.reviews.tr()}',
                                              style: const TextStyle(
                                                color: AppColors.darkGreyText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        LocaleKeys.in_stock.tr(),
                                        // 'In Stock',
                                        style: const TextStyle(
                                          color: AppColors.greenText,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    data?['name'].toString() ?? 'Loading...',
                                    // dataName,
                                    //LocaleKeys.product_title.tr(),
                                    // 'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
                                    style: const TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    // '\$ $dataPrice',
                                    '\$ ${data?['price']}',
                                    style: const TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    LocaleKeys.colors.tr(),
                                    // 'Colors',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ProductColorPicker(
                                    onProductPicked: (val) {
                                      pickedProductColor = val;
                                    },
                                    // availableProductColor: [
                                    //   'assets/images/content_img1.png',
                                    //   'assets/images/imgcolor2.png',
                                    //   'assets/images/imgcolor3.png',
                                    //   'assets/images/imgcolor4.png',
                                    //   'assets/images/imgcolor1.png',
                                    //   'assets/images/imgcolor6.png',
                                    // ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    LocaleKeys.sizes.tr(),
                                    // 'Sizes',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppColors.greyText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizePicker(
                                    onSizePicked: (val) {
                                      pickedProductSizes = val;
                                    },
                                    // availableSizes: [
                                    //   'xss',
                                    //   'xs',
                                    //   's',
                                    //   'm',
                                    //   'l',
                                    //   'xl',
                                    // ],
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
            ProductDetailsContainer(
              productId: productId, //widget.productId,
            ),
            ProductReviewsContainer(
              productId: productId, //widget.productId,
            ),
            const SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                LocaleKeys.products_list_title.tr(),

                // 'Products related to this item',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color: AppColors.darkText,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const ProductsRelatedList(),
            const SizedBox(
              height: 20,
            ),
            //  ],
            //  ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(left: 26, right: 26, top: 8),
          width: MediaQuery.of(context).size.width,
          height: 87,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  //back to clothing page
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset('assets/icons/arrow_left_bottom.svg'),
              ),
              Builder(builder: (context) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.yellow,
                    onPrimary: Colors.white,
                    minimumSize: const Size(215, 48),
                  ),
                  onPressed: () {
                    // CollectionReference collectionRef =
                    //     FirebaseFirestore.instance.collection('cart');
                    // collectionRef.doc(widget.productId).set({
                    //   'name': dataName,
                    //   'price': dataPrice,
                    //   'imageUrl': dataimgUrl,
                    //   'quantity':_itemCounter,
                    // });

                    // setState(() {
                    //   _itemCounter = 1;
                    // });
                    showModalBottomSheet<Widget?>(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return AddToCartBottomSheet(
                          item: 1,
                          productId: productId, // widget.productId,
                        );
                      },
                    );
                  },
                  child: Text(
                    LocaleKeys.add_to_cart.tr(),
                    // 'Add to cart',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                );
                //  )
              }),
              GestureDetector(
                onTap: () {
                  //add to favorite
                  Navigator.of(context).pop();
                },
                child: _icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
