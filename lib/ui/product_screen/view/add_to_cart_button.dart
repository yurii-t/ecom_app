import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecom_app/data/models/cart.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_screen/widgets/product_color_picker.dart';

import 'package:ecom_app/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartButton extends StatefulWidget {
  final String productId;
  int item;
  AddToCartButton({required this.item, required this.productId, Key? key})
      : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  late String dataName;
  late num dataPrice;
  late String dataimgUrl;
  List colors = <String>[];
  String colorsJoined = '';
  String sizesJoined = '';

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
                  ? const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.network(
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
                                        textAlign: TextAlign.start,
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
                            Text('${widget.item}'),
                            const SizedBox(
                              height: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.item == 0) {
                                    return null;
                                  }

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
            initPick: const [],
            onSizePicked: (val) {
              sizesJoined = val;
              print(sizesJoined);
            },
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
                  final Cart cartItem = Cart(
                    id: widget.productId,
                    name: dataName,
                    imageUrl: dataimgUrl,
                    colors: colorsJoined,
                    sizes: sizesJoined,
                    price: dataPrice,
                    quantity: widget.item,
                  );
                  BlocProvider.of<CartBloc>(context)
                      .add(AddProduct(cartItem, widget.productId));
                  Navigator.of(context).pop();
                },
                child: Text(
                  LocaleKeys.add_to_cart.tr(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
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
