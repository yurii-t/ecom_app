import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SortBottomSheet extends StatefulWidget {
  //String selectedSortItem;
  const SortBottomSheet({
    //required this.selectedSortItem,
    Key? key,
  }) : super(key: key);

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  String _selectedSortItem = LocaleKeys.featured.tr(); //'Featured';

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
            Expanded(child: Text(_selectedSortItem)),
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
                            LocaleKeys.sort_by.tr(),
                            // 'Sort by',
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
                            _selectedSortItem = LocaleKeys.new_text.tr();
                            //  'New';
                          });
                        },
                        child: Text(
                          LocaleKeys.new_text.tr(),
                          // 'New',
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
                          LocaleKeys.popular.tr(),
                          // 'Popular',
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
                          LocaleKeys.price_high_to_low.tr(),
                          // 'Price high to low',
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
                          LocaleKeys.price_low_to_high.tr(),
                          // 'Price low to high',
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
                          LocaleKeys.featured.tr(),
                          // 'Featured',
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
                          LocaleKeys.sales.tr(),
                          // 'Sale',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      //      SizedBox(height: 8,),

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
    // return Padding(
    //   padding: const EdgeInsets.only(left: 24),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       Center(
    //         child: Padding(
    //           padding: const EdgeInsets.only(top: 33),
    //           child: Text(
    //             LocaleKeys.sort_by.tr(),
    //             // 'Sort by',
    //             style: const TextStyle(
    //               fontSize: 19,
    //               fontWeight: FontWeight.w700,
    //               color: AppColors.darkText,
    //             ),
    //           ),
    //         ),
    //       ),

    //       const SizedBox(
    //         height: 12,
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           setState(() {
    //             widget.selectedSortItem = LocaleKeys.new_text.tr();
    //             //_selectedSortItem = LocaleKeys.new_text.tr();
    //             //  'New';
    //           });
    //         },
    //         child: Text(
    //           LocaleKeys.new_text.tr(),
    //           // 'New',
    //           style: const TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //             color: AppColors.darkGreyText,
    //           ),
    //         ),
    //       ),
    //       //    SizedBox(height: 8,),
    //       TextButton(
    //         onPressed: () {},
    //         child: Text(
    //           LocaleKeys.popular.tr(),
    //           // 'Popular',
    //           style: const TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //             color: AppColors.darkGreyText,
    //           ),
    //         ),
    //       ),
    //       //     SizedBox(height: 8,),
    //       TextButton(
    //         onPressed: () {},
    //         child: Text(
    //           LocaleKeys.price_high_to_low.tr(),
    //           // 'Price high to low',
    //           style: const TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //             color: AppColors.darkGreyText,
    //           ),
    //         ),
    //       ),
    //       //     SizedBox(height: 8,),
    //       TextButton(
    //         onPressed: () {},
    //         child: Text(
    //           LocaleKeys.price_low_to_high.tr(),
    //           // 'Price low to high',
    //           style: const TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //             color: AppColors.darkGreyText,
    //           ),
    //         ),
    //       ),
    //       //     SizedBox(height: 8,),
    //       TextButton(
    //         onPressed: () {},
    //         child: Text(
    //           LocaleKeys.featured.tr(),
    //           // 'Featured',
    //           style: const TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //             color: AppColors.darkGreyText,
    //           ),
    //         ),
    //       ),
    //       //      SizedBox(height: 8,),
    //       TextButton(
    //         onPressed: () {},
    //         child: Text(
    //           LocaleKeys.sales.tr(),
    //           // 'Sale',
    //           style: const TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //             color: AppColors.darkGreyText,
    //           ),
    //         ),
    //       ),
    //       //      SizedBox(height: 8,),

    //       const SizedBox(
    //         height: 12,
    //       ),
    //     ],
    //   ),
    // );
  }
}
