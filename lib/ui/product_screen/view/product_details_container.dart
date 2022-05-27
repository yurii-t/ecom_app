import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String productId;
  const ProductDetailsContainer({required this.productId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
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
            : ExpandableNotifier(
                child: Container(
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
                    children: [
                      Text(
                        LocaleKeys.product_details.tr(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: AppColors.darkText,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expandable(
                        collapsed: ExpandableButton(
                          child: Text(
                            data?['description'].toString() ?? 'Loading...',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                        expanded: ExpandableButton(
                          child: Text(
                            data?['description'].toString() ?? 'Loading...',
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final controller =
                              ExpandableController.of(context, required: true);

                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                controller?.toggle();
                              },
                              child: const Icon(Icons.keyboard_arrow_down),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
