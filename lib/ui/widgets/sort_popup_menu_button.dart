import 'package:easy_localization/easy_localization.dart';

import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/clothing_screen/bloc/clothing_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortPopupMenuButton extends StatefulWidget {
  const SortPopupMenuButton({Key? key}) : super(key: key);

  @override
  State<SortPopupMenuButton> createState() => _SortPopupMenuButtonState();
}

class _SortPopupMenuButtonState extends State<SortPopupMenuButton> {
  String dropdownvalue = LocaleKeys.featured.tr(); //'Featured';
  List<String> dropButtonItems = [
    LocaleKeys.featured.tr(), //'Featured',
    LocaleKeys.new_text.tr(), // 'New',
    LocaleKeys.popular.tr(), // 'Popular',
    LocaleKeys.price_high_to_low.tr(), // 'Price high to low',
    LocaleKeys.price_low_to_high.tr(), // 'Price low to high',
  ];
  String _currentItemSelected = LocaleKeys.featured.tr();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.sort_by.tr(),
          // 'Sort by: ',
          style: const TextStyle(
            color: AppColors.greyText,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return dropButtonItems.map((str) {
              return PopupMenuItem(
                value: str,
                child: Text(str.toString()),
              );
            }).toList();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('$_currentItemSelected '),
              SvgPicture.asset('assets/icons/dropdown.svg'),
            ],
          ),
          onSelected: (v) {
            setState(() {
              print('!!!===== $v');
              _currentItemSelected = v.toString();
            });
            if (v == dropButtonItems[1]) {
              context.read<ClothingScreenBloc>().add(SortByDateProduct());
            } else if (v == dropButtonItems[3]) {
              context.read<ClothingScreenBloc>().add(SortHighToLow());
            } else if (v == dropButtonItems[4]) {
              context.read<ClothingScreenBloc>().add(SortLowToHigh());
            }
          },
        ),
      ],
    );
  }
}
