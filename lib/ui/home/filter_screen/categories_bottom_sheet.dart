import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesBottomSheet extends StatefulWidget {
  const CategoriesBottomSheet({Key? key}) : super(key: key);

  @override
  State<CategoriesBottomSheet> createState() => _CategoriesBottomSheetState();
}

class _CategoriesBottomSheetState extends State<CategoriesBottomSheet> {
  String _selectedCategoryItem = LocaleKeys.dresses.tr(); //'Dresses';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(left: 16, right: 22),
      width:
          //343,
          MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayLight),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Builder(builder: (context) {
        return GestureDetector(
          child: Row(children: [
            Expanded(child: Text(_selectedCategoryItem)),
            //Icon(Icons.arrow_drop_down),
            // const Icon(Icons.keyboard_arrow_right),
            SvgPicture.asset(
              'assets/icons/arrow_right_grey.svg',
            ),
          ]),
          onTap: () {
            showBottomSheet<Widget?>(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 33),
                          child: Text(
                            LocaleKeys.womens_fashion.tr(),
                            // 'Women`s Fashion',
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
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategoryItem = LocaleKeys.clothing.tr();
                            // 'Clothing';
                          });
                        },
                        child: Text(
                          LocaleKeys.clothing.tr(),
                          // 'Clothing',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //    SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.shoes.tr(),
                          // 'Shoes',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //     SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.jewelry.tr(),
                          // 'Jewelry',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //     SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.watches.tr(),
                          // 'Watches',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //     SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.handbags.tr(),
                          // 'Handbags',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //      SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.accessories.tr(),
                          // 'Accessories',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //      SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.mens_fashion.tr(),
                          // 'Man`s Fashion',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //      SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.girls_fashion.tr(),
                          // 'Girl`s Fashion',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //      SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.boys_fashion.tr(),
                          // 'Boy`s Fashion',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
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
