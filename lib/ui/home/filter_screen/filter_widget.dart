import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/core/util/color_picker.dart';
import 'package:ecom_app/core/util/size_picker.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  double _startValue = 0;
  double _endValue = 5000;
  double minValue = 0;
  double maxValue = 8000.0;
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  String _selectedCategoryItem = LocaleKeys.dresses.tr(); //'Dresses';
  String _selectedSortItem = LocaleKeys.featured.tr(); //'Featured';
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Lark & Ro',
      'Astylish',
      'ECOWISH',
      'Angashion',
      'Brand A',
      'Brand B'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startController.text = '\$$_startValue';
    endController.text = '\$$_endValue';
    startController.addListener(_setStartValue);
    endController.addListener(_setEndValue);
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  _setStartValue() {
    if (double.parse(startController.text).roundToDouble() <=
            double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _startValue = double.parse(startController.text).roundToDouble();
      });
    }
    // print("Second text field: ${startController.text}");
  }

  _setEndValue() {
    if (double.parse(startController.text).roundToDouble() <=
            double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _endValue = double.parse(endController.text).roundToDouble();
      });
    }
    // print("Second text field: ${endController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.backGroundColor,
            body: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 88,
                decoration: const BoxDecoration(
                  gradient: AppColors.purpleGradient,
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
                          child:
                              SvgPicture.asset('assets/icons/arrow_left.svg')),
                      // const Icon(
                      //   Icons.menu,
                      //   color: Colors.white,
                      // ),
                      //
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
                          onPressed: () {},
                          child: Text(
                            LocaleKeys.clear.tr(),
                            // 'Clear',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ))
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
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RangeSlider(
                        min: minValue,
                        max: maxValue,
                        activeColor: AppColors.yellowColor,
                        inactiveColor: AppColors.grayLightColor,
                        values: RangeValues(_startValue, _endValue),
                        onChanged: (values) {
                          setState(() {
                            _startValue = values.start;
                            _endValue = values.end;
                            startController.text =
                                '\$' + values.start.roundToDouble().toString();
                            endController.text =
                                '\$' + values.end.roundToDouble().toString();
                          });
                        }),
                    Container(
                      width:
                          //343,
                          MediaQuery.of(context).size.width,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grayLightColor),
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
                              color: AppColors.grayLightColor,
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
                        color: AppColors.greyTextColor,
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
                        border: Border.all(color: AppColors.grayLightColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                      ),
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          child: Row(children: [
                            Expanded(child: Text(_selectedCategoryItem)),
                            //Icon(Icons.arrow_drop_down),
                            const Icon(Icons.keyboard_arrow_right)
                          ]),
                          onTap: () {
                            showBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                )),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 33),
                                            child: Text(
                                              LocaleKeys.womens_fashion.tr(),
                                              // 'Women`s Fashion',
                                              style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      AppColors.darkTextColor),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 12,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _selectedCategoryItem =
                                                    LocaleKeys.clothing.tr();
                                                // 'Clothing';
                                              });
                                            },
                                            child: Text(
                                              LocaleKeys.clothing.tr(),
                                              // 'Clothing',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //    SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.shoes.tr(),
                                              // 'Shoes',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.jewelry.tr(),
                                              // 'Jewelry',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.watches.tr(),
                                              // 'Watches',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.handbags.tr(),
                                              // 'Handbags',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.accessories.tr(),
                                              // 'Accessories',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.mens_fashion.tr(),
                                              // 'Man`s Fashion',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.girls_fashion.tr(),
                                              // 'Girl`s Fashion',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.boys_fashion.tr(),
                                              // 'Boy`s Fashion',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.brand.tr(),
                      // 'Brand',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyTextColor,
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
                        border: Border.all(color: AppColors.grayLightColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                      ),
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          child: Row(children: [
                            Expanded(child: Text(_selectedItems.join(', '))),
                            //Icon(Icons.arrow_drop_down),
                            const Icon(Icons.keyboard_arrow_right)
                          ]),
                          onTap: () {
                            _showMultiSelect();
                          },
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
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const MyColorPicker(availableColors: [
                      Colors.blue,
                      Colors.green,
                      Colors.greenAccent,
                      Colors.yellow,
                      Colors.orange,
                      Colors.red,
                    ], initialColor: Colors.blue),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LocaleKeys.sizes.tr(),
                      // 'Sizes',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const MySizePicker(
                      availableSizes: ['xss', 'xs', 's', 'm', 'l', 'xl'],
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
                        color: AppColors.greyTextColor,
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
                        border: Border.all(color: AppColors.grayLightColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.white,
                      ),
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          child: Row(children: [
                            Expanded(child: Text(_selectedSortItem)),
                            //Icon(Icons.arrow_drop_down),
                            const Icon(Icons.keyboard_arrow_right)
                          ]),
                          onTap: () {
                            showBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                )),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 33),
                                            child: Text(
                                              LocaleKeys.sort_by.tr(),
                                              // 'Sort by',
                                              style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      AppColors.darkTextColor),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 12,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _selectedSortItem =
                                                    LocaleKeys.new_text.tr();
                                                //  'New';
                                              });
                                            },
                                            child: Text(
                                              LocaleKeys.new_text.tr(),
                                              // 'New',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //    SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.popular.tr(),
                                              // 'Popular',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.price_high_to_low.tr(),
                                              // 'Price high to low',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.price_low_to_high.tr(),
                                              // 'Price low to high',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.featured.tr(),
                                              // 'Featured',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              LocaleKeys.sales.tr(),
                                              // 'Sale',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),

                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.yellowColor,
                          onPrimary: Colors.white,
                          minimumSize: const Size(360, 50),
                        ),
                        onPressed: () {},
                        child: Text(
                          '${LocaleKeys.result.tr()} (166)',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )),
                  ],
                ),
              )
            ])));
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        LocaleKeys.select_brand.tr(),
        // 'Select Brand'
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            LocaleKeys.cancel.tr(),
            // 'Cancel'
          ),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: Text(
            LocaleKeys.submit.tr(),
            // 'Submit'
          ),
          onPressed: _submit,
        ),
      ],
    );
  }
}
