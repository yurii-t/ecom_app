import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String productId;
  ProductDetails({required this.productId, Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // int id = int.parse(widget.productId)
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
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('products')
            .doc(widget.productId)
            .get(),
        builder: (context, snapshot) {
          DocumentSnapshot? data = snapshot.data;

          return !snapshot.hasData
              ? const CircularProgressIndicator()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: _minHeight, //175,
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 16,
                    right: 16,
                    bottom: 12,
                  ),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.product_details.tr(),
                        // 'Product details',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: AppColors.darkText,
                        ),
                      ),
                      Text(
                        data?['description'].toString() ?? 'Loading...',
                        // LocaleKeys.product_description.tr(),
                        // 'Women`s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li bfmfamnbnmsfbfmsmnfs kadlk klfkk n NMF Women`s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li bfmfamnbnmsfbfmsmnfs kadlk klfkk n NMF',
                        overflow:
                            _isOpen == false ? TextOverflow.ellipsis : null,
                        maxLines: _isOpen == false ? 4 : null,

                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.darkText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          onPressed: () {
                            openReview();
                            setState(() {
                              _isOpen = !_isOpen;
                            });
                          },
                          icon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
