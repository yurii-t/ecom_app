import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';

import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/add_to_cart_screen.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_details.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_carousel.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_reviews.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/products_related_list.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/widgets/product_color_picker.dart';
import 'package:ecom_app/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductPageScreen extends StatefulWidget {
  const ProductPageScreen({Key? key}) : super(key: key);

  @override
  State<ProductPageScreen> createState() => _ProductPageScreenState();
}

class _ProductPageScreenState extends State<ProductPageScreen> {
  final List<String> imgSlider = [
    'assets/images/img_gal.jpg',
    'assets/images/product_img1.png',
    'assets/images/product_img12.jpg',
    'assets/images/content_img1.png',
  ];

  int _itemCounter = 0;
  var _icon = SvgPicture.asset(
    'assets/icons/heart11.svg',
  );
  var _iconStar = SvgPicture.asset(
    'assets/icons/star.svg',
  );
  // int _sliderProductCurrent = 0;
  // final CarouselController _sliderProductController = CarouselController();
  bool _isOpen = false;
  static double _minHeight = 175;
  final double _maxHeight = 600;

  void openReview() {
    if (!_isOpen) {
      setState(() {
        _minHeight = _maxHeight;
      });
    } else {
      setState(() {
        _minHeight = 175;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: false,
        // extendBody: true,
        backgroundColor: AppColors.backGround,
        body: ListView(
          children: [
            Column(
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
                      const ProductPageCarousel(),
                      const SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
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
                                      Text(
                                        '8 ${LocaleKeys.reviews.tr()}',
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
                              LocaleKeys.product_title.tr(),
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
                            const Text(
                              r'$102.99',
                              style: TextStyle(
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
                            const ProductColorPicker(
                              availableProductColor: [
                                'assets/images/content_img1.png',
                                'assets/images/imgcolor2.png',
                                'assets/images/imgcolor3.png',
                                'assets/images/imgcolor4.png',
                                'assets/images/imgcolor1.png',
                                'assets/images/imgcolor6.png',
                              ],
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
                            const SizePicker(
                              availableSizes: [
                                'xss',
                                'xs',
                                's',
                                'm',
                                'l',
                                'xl',
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const ProductDetails(),
                const ProductReviews(),
                const SizedBox(
                  height: 34,
                ),
                Text(
                  LocaleKeys.products_list_title.tr(),
                  // 'Products related to this item',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                    color: AppColors.darkText,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ProductsRelatedList(),
                const SizedBox(
                  height: 20,
                ),
              ],
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
                    setState(() {
                      _itemCounter = 1;
                    });
                    showModalBottomSheet<Widget?>(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return AddToCartScreen(
                          item: _itemCounter,
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
