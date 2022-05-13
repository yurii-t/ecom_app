import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/widgets/star_icon_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductReviewsContainer extends StatelessWidget {
  final String productId;
  const ProductReviewsContainer({required this.productId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Timestamp datafirstTime;
    late DateTime dateFirst;
    String datafirstTimeFormatDate = '';
    int value = 0;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .collection('reviews')
          .snapshots(),
      builder: (context, snapshot) {
        final DocumentSnapshot? dataFirst = snapshot.data?.docs.first;

        if (dataFirst != null) {
          datafirstTime = dataFirst['date'] as Timestamp;
          dateFirst = datafirstTime.toDate();
          datafirstTimeFormatDate =
              DateFormat.yMMMd().add_jm().format(dateFirst);
        }

        return Container(
          width: MediaQuery.of(context).size.width,
          height: 273,
          padding: const EdgeInsets.only(
            top: 24,
            left: 16,
            right: 16,
            bottom: 16,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.reviews.tr(),
                      // 'Reviews',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: AppColors.darkText,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog<Dialog>(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: ListView.builder(
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot? data =
                                    snapshot.data?.docs[index];

                                final Timestamp time =
                                    data?['date'] as Timestamp;
                                final DateTime date = time.toDate();
                                final String formatDate =
                                    DateFormat.yMMMd().add_jm().format(date);

                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 273,
                                  padding: const EdgeInsets.only(
                                    top: 24,
                                    left: 16,
                                    right: 16,
                                    bottom: 16,
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
                                    children: [
                                      Text(
                                        data?['userName'].toString() ??
                                            'Loading...',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: AppColors.darkText,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                StarIconList(
                                                  productId: productId,
                                                ),
                                                Text(
                                                  '${data?['rating'].toString()} ${LocaleKeys.reviews.tr()}',
                                                  style: const TextStyle(
                                                    color:
                                                        AppColors.darkGreyText,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            formatDate,
                                            style: const TextStyle(
                                              color: AppColors.darkGreyText,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data?['reviewText'].toString() ??
                                            'Loading...',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: AppColors.darkText,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?['likes'].toString()} ${LocaleKeys.helpful_text.tr()}',
                                        style: const TextStyle(
                                          color: AppColors.greyText,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: null,
                                              child: Text(
                                                LocaleKeys.comment.tr(),
                                                style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: AppColors.darkText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                LocaleKeys.helpful.tr(),
                                                style: const TextStyle(
                                                  color: AppColors.greyText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/like_button_icon.svg',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.see_all.tr(),
                          style: const TextStyle(
                            color: AppColors.greyText,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/arrow_right_grey.svg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                dataFirst?['userName'].toString() ?? 'Loading...',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.darkText,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        StarIconList(
                          productId: productId,
                        ),
                        Text(
                          '${dataFirst?['rating'].toString()}  ${LocaleKeys.reviews.tr()}',
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
                    datafirstTimeFormatDate,
                    style: const TextStyle(
                      color: AppColors.darkGreyText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                dataFirst?['reviewText'].toString() ?? 'Loading...',
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.darkText,
                ),
              ),
              Text(
                '${dataFirst?['likes'].toString()} ${LocaleKeys.helpful_text.tr()}',
                style: const TextStyle(
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: null,
                      child: Text(
                        LocaleKeys.comment.tr(),
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.darkText,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        LocaleKeys.helpful.tr(),
                        style: const TextStyle(
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/like_button_icon.svg',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
