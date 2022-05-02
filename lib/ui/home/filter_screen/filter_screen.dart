import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/filter_screen/brand_multi_select_dialog.dart';
import 'package:ecom_app/ui/home/filter_screen/categories_bottom_sheet.dart';
import 'package:ecom_app/ui/home/filter_screen/sort_bottom_sheet.dart';
import 'package:ecom_app/ui/home/filter_screen/widgets/filter_color_picker.dart';
import 'package:ecom_app/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double minValue = 0;
  double maxValue = 8000;
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  double _startValue = 0;
  double _endValue = 5000;
  String pickedSize = '';

  // String _selectedCategoryItem = LocaleKeys.dresses.tr(); //'Dresses';
  // String _selectedSortItem = LocaleKeys.featured.tr(); //'Featured';
  List<String> _selectedItems = [];

  double get startControllerValue =>
      double.parse(startController.text).roundToDouble();
  double get endControllerValue =>
      double.parse(endController.text).roundToDouble();

  bool get canChangeValue =>
      startControllerValue <= endControllerValue &&
      startControllerValue >= minValue &&
      endControllerValue >= minValue &&
      startControllerValue <= maxValue &&
      startControllerValue <= maxValue;

  @override
  void initState() {
    super.initState();
    // startController.text = '\$$_startValue';
    // endController.text = '\$$_endValue';
    startController.text = '$_startValue';
    endController.text = '$_endValue';
    startController.addListener(_setStartValue);
    endController.addListener(_setEndValue);
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: ListView(
          children: [
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 88,
                decoration: const BoxDecoration(
                  gradient: AppGradient.purpleGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('assets/icons/arrow_left.svg'),
                      ),
                      Text(
                        LocaleKeys.filter.tr(),
                        // 'Filter',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const FilterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          LocaleKeys.clear.tr(),
                          // 'Clear',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.price.tr(),
                      // 'Price',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyText,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RangeSlider(
                      min: minValue,
                      max: maxValue,
                      activeColor: AppColors.yellow,
                      inactiveColor: AppColors.grayLight,
                      values: RangeValues(_startValue, _endValue),
                      onChanged: (values) {
                        setState(() {
                          _startValue = values.start;
                          _endValue = values.end;
                          startController.text =
                              values.start.roundToDouble().toString();
                          // r'$' + values.start.roundToDouble().toString();
                          endController.text =
                              values.end.roundToDouble().toString();
                          // r'$' + values.end.roundToDouble().toString();
                        });
                      },
                    ),
                    Container(
                      width:
                          //343,
                          MediaQuery.of(context).size.width,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grayLight),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                controller: startController,
                                // initialValue:'$_startValue' ,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              height: 48,
                              width: 1,
                              color: AppColors.grayLight,
                            ),
                            SizedBox(
                              width: 170,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                controller: endController,
                                // initialValue:endController.text ,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.categories.tr(),
                      // 'Categories',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyText,
                      ),
                    ),
                    const CategoriesBottomSheet(),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.brand.tr(),
                      // 'Brand',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyText,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(left: 16, right: 22),
                      width:
                          //343,
                          MediaQuery.of(context).size.width,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grayLight),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                      ),
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          child: Row(children: [
                            Expanded(child: Text(_selectedItems.join(', '))),
                            //Icon(Icons.arrow_drop_down),
                            //const Icon(Icons.keyboard_arrow_right),
                            SvgPicture.asset(
                              'assets/icons/arrow_right_grey.svg',
                            ),
                          ]),
                          onTap: _showMultiSelect,
                          // () {
                          //   _showMultiSelect();
                          // },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.colors.tr(),
                      // 'Colors',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyText,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const FilterColorPicker(
                      availableColors: [
                        Colors.blue,
                        Colors.green,
                        Colors.greenAccent,
                        Colors.yellow,
                        Colors.orange,
                        Colors.red,
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.sizes.tr(),
                      // 'Sizes',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyText,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizePicker(
                      onSizePicked: (val) {
                        pickedSize = val;
                      },
                      // availableSizes: ['xss', 'xs', 's', 'm', 'l', 'xl'],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.sort_by.tr(),
                      // 'Sort by',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyText,
                      ),
                    ),
                    const SortBottomSheet(),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow,
                        onPrimary: Colors.white,
                        minimumSize: const Size(360, 50),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop([_startValue, _endValue]);
                      },
                      child: Text(
                        '${LocaleKeys.result.tr()} (166)',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  void _setStartValue() {
    if (canChangeValue) {
      setState(() {
        _startValue = startControllerValue;
      });
    }
  }

  void _setEndValue() {
    if (canChangeValue) {
      setState(() {
        _endValue = endControllerValue;
      });
    }
  }

  Future<void> _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final _items = <String>[
      'Lark & Ro',
      'Astylish',
      'ECOWISH',
      'Angashion',
      'Brand A',
      'Brand B',
    ];

    final results = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        return BrandMultiSelectDialog(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }
}
