import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductReviews extends StatefulWidget {
  const ProductReviews({Key? key}) : super(key: key);

  @override
  State<ProductReviews> createState() => _ProductReviewsState();
}

class _ProductReviewsState extends State<ProductReviews> {
  var _iconStar = SvgPicture.asset(
    'assets/icons/star.svg',
  );
  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  Text(
                    LocaleKeys.see_all.tr(),
                    // 'See All',
                    style: const TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.greyText,
                  ),
                ],
              ),
            ],
          ),
          const Text(
            'Olha Chabanova',
            style: TextStyle(
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
              const Text(
                'June 5,2021',
                style: TextStyle(
                  color: AppColors.darkGreyText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            LocaleKeys.review_text.tr(),
            // 'I`m old (rolling through my 50`s). But, this is my daughter in law`s favorite color right now.❤️ So I wear it whenever we hang out! She`s my fashion consultant who keeps me on trend🤣',
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.darkText,
            ),
          ),
          Text(
            '835 ${LocaleKeys.review_text.tr()}',
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
                  onTap: () {},
                  child: Text(
                    LocaleKeys.comment.tr(),
                    // 'Comment',
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
                    // 'Helpful ',
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
  }
}
