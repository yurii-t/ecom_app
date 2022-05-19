import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';

import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_screen/view/add_to_cart_button.dart';
import 'package:ecom_app/ui/product_screen/view/product_details_container.dart';
import 'package:ecom_app/ui/product_screen/view/product_reviews_container.dart';
import 'package:ecom_app/ui/product_screen/view/product_screen_carousel.dart';
import 'package:ecom_app/ui/product_screen/view/products_related_list.dart';
import 'package:ecom_app/ui/product_screen/widgets/product_color_picker.dart';

import 'package:ecom_app/ui/widgets/size_picker.dart';
import 'package:ecom_app/ui/widgets/star_icon_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pickedProductColor = '';
    String pickedProductSizes = '';

    final _icon = SvgPicture.asset(
      'assets/icons/heart11.svg',
    );
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        extendBody: false,
        backgroundColor: AppColors.backGround,
        body: ListView(
          children: [
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
                    productId: productId,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('products')
                        .doc(productId)
                        .get(),
                    builder: (context, snapshot) {
                      final DocumentSnapshot? data = snapshot.data;

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
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    LocaleKeys.sizes.tr(),
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
                                    initPick: [],
                                    onSizePicked: (val) {
                                      pickedProductSizes = val;
                                    },
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
              productId: productId,
            ),
            ProductReviewsContainer(
              productId: productId,
            ),
            const SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                LocaleKeys.products_list_title.tr(),
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
                    showModalBottomSheet<Widget?>(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return AddToCartButton(
                          item: 1,
                          productId: productId,
                        );
                      },
                    );
                  },
                  child: Text(
                    LocaleKeys.add_to_cart.tr(),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
              GestureDetector(
                onTap: () {
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
