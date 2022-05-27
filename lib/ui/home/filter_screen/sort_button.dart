import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SortButton extends StatelessWidget {
  final Function(String) onSortPicked;
  final ValueNotifier<String> sortNotifier;

  const SortButton({
    required this.sortNotifier,
    required this.onSortPicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> sortItems = [
      LocaleKeys.sales.tr(),
      LocaleKeys.featured.tr(),
      LocaleKeys.popular.tr(),
      LocaleKeys.new_text.tr(),
      LocaleKeys.price_high_to_low.tr(),
      LocaleKeys.price_low_to_high.tr(),
    ];

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
              child: ValueListenableBuilder(
                valueListenable: sortNotifier,
                builder: (context, notifierSortItem, child) {
                  return Text(
                    notifierSortItem.toString(),
                  );
                },
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
                            LocaleKeys.sort_by.tr(),
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
                      for (final sortItem in sortItems)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              sortNotifier.value = sortItem;
                              onSortPicked(sortItem);

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              sortItem,
                              textAlign: TextAlign.start,
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
