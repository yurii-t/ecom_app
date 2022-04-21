import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_screen.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  //int pageIndex;

  const CategoriesScreen({
    Key? key,
    // required this.pageIndex,
  }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //   builder: (context) => const ClothingWidget()));
                        setState(() {
                          pageIndex = 1;
                        });
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CatalogueScreen(),
                          ),
                        );
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
      ),
    );
  }
}
