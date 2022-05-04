import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/widgets/product_color_picker.dart';
import 'package:ecom_app/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartScreen extends StatefulWidget {
  final String productId;
  int item;
  AddToCartScreen({required this.item, required this.productId, Key? key})
      : super(key: key);

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  late String dataName;
  late num dataPrice;
  late String dataimgUrl;
  List colors = <String>[];
  String colorsJoined = '';
  String sizesJoined = '';
  // int _itemCounter = 0;
  var _icon = SvgPicture.asset(
    'assets/icons/heart11.svg',
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 33,
        bottom: 29,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('products')
                .doc(widget.productId)
                .get(),
            builder: (context, snapshot) {
              final DocumentSnapshot? data = snapshot.data;
              if (data != null) {
                dataName = data['name'].toString();
                dataPrice = data['price'] as num;
                dataimgUrl = data['imageUrl'].toString();
              }

              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.network(
                                // 'assets/images/content_img1.png',
                                dataimgUrl,
                                width: 80,
                                height: 80,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 60,
                                      ),
                                      child: Text(
                                        dataName,
                                        // LocaleKeys.product_title.tr(),
                                        // 'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
                                        textAlign: TextAlign.start,
                                        // overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.darkText,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '\$$dataPrice',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.darkText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  //_itemCounter++;
                                  widget.item++;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/icons/plus_icon.svg',
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // Text('$_itemCounter'),
                            Text('${widget.item}'),
                            const SizedBox(
                              height: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.item == 0) return null;
                                  // _itemCounter--;
                                  widget.item--;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/icons/minus_icon.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
            },
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
              colorsJoined = val;
              print(colorsJoined);
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
              sizesJoined = val;
              print(sizesJoined);
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
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  //back to clothing page
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'assets/icons/arrow_left_bottom.svg',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.yellow,
                  onPrimary: Colors.white,
                  minimumSize: const Size(215, 48),
                ),
                onPressed: () {
                  final CollectionReference collectionRef =
                      FirebaseFirestore.instance.collection('cart');
                  collectionRef.doc(widget.productId).set({
                    'name': dataName,
                    'price': dataPrice,
                    'imageUrl': dataimgUrl,
                    'quantity': widget.item,
                    'colors': colorsJoined,
                    'sizes': sizesJoined,
                  });
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
              ),
              GestureDetector(
                onTap: () {
                  //back to clothing page
                  Navigator.of(context).pop();
                },
                child: _icon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
