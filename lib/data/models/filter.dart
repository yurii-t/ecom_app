import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

class Filter {
  final double minValue;
  final double maxValue;
  // final String category;
  // final String brand;
  final List<String> selectedSizeItems;
  final String selectedCategoryItem;
  final String selectedSortItem;
  final Color selectedColor;
  final List<String> selectedBrandItem;

  const Filter({
    required this.minValue,
    required this.maxValue,
    required this.selectedSizeItems,
    required this.selectedCategoryItem,
    required this.selectedSortItem,
    required this.selectedColor,
    required this.selectedBrandItem,
  });
  Filter.initial()
      : minValue = 0,
        maxValue = 5000,
        selectedSizeItems = [],
        selectedCategoryItem = LocaleKeys.clothing.tr(),
        selectedSortItem = LocaleKeys.featured.tr(),
        selectedColor = Colors.transparent,
        selectedBrandItem = [];
}
