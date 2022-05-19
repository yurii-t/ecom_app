import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesButton extends StatefulWidget {
  String initCategory;
  CategoriesButton({required this.initCategory, Key? key}) : super(key: key);

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  final List<String> categories = [
    LocaleKeys.clothing.tr(),
    LocaleKeys.shoes.tr(),
    LocaleKeys.jewelry.tr(),
    LocaleKeys.watches.tr(),
    LocaleKeys.handbags.tr(),
    LocaleKeys.accessories.tr(),
    LocaleKeys.mens_fashion.tr(),
    LocaleKeys.girls_fashion.tr(),
    LocaleKeys.boys_fashion.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(left: 16, right: 22),
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayLight),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Builder(builder: (context) {
        return GestureDetector(
          child: Row(children: [
            Expanded(
              child: Text(
                widget.initCategory,
              ),
            ),
            SvgPicture.asset(
              'assets/icons/arrow_right_grey.svg',
            ),
          ]),
          onTap: () {
            showModalBottomSheet<Widget?>(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 33),
                          child: Text(
                            LocaleKeys.womens_fashion.tr(),
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      for (final category in categories)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.initCategory = category;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGreyText,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
