import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/filter_screen/filter_screen.dart';
import 'package:ecom_app/ui/widgets/item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClothingScreen extends StatefulWidget {
  final Function() onBackButtonPressed;
  const ClothingScreen({
    required this.onBackButtonPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<ClothingScreen> createState() => _ClothingScreenState();
}

class _ClothingScreenState extends State<ClothingScreen> {
  String dropdownvalue = LocaleKeys.featured.tr(); //'Featured';
  List<String> dropButtonItems = [
    LocaleKeys.featured.tr(), //'Featured',
    LocaleKeys.new_text.tr(), // 'New',
    LocaleKeys.popular.tr(), // 'Popular',
    LocaleKeys.price_high_to_low.tr(), // 'Price high to low',
    LocaleKeys.price_low_to_high.tr(), // 'Price low to high',
  ];
  String query = '';
  late Stream<QuerySnapshot> collectionRef;
  dynamic startPrice = null;
  dynamic endPrice = null;
  int _selectedTab = 0;
  late String _currentItemSelected;

  @override
  void initState() {
    super.initState();
    _currentItemSelected = dropButtonItems[0];
  }

  void navigateAndDisplaySelection(BuildContext context) async {
    final List<double>? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FilterScreen()),
    );
    setState(() {
      startPrice = result?[0] ?? null;
      endPrice = result?[1] ?? null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (query != '' && query != null) {
      collectionRef = FirebaseFirestore.instance
          .collection('products')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf7ff')
          .snapshots();
    } else if (startPrice != null && endPrice != null) {
      collectionRef = FirebaseFirestore.instance
          .collection('products')
          .where('price', isGreaterThanOrEqualTo: startPrice)
          .where('price', isLessThanOrEqualTo: endPrice)
          .snapshots();
    } else {
      collectionRef = FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: 'Clothing')
          .snapshots();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 132,
                decoration: const BoxDecoration(
                  gradient: AppGradient.purpleGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: widget.onBackButtonPressed,
                        child: SvgPicture.asset(
                          'assets/icons/arrow_left.svg',
                        ),
                      ),
                      Text(
                        LocaleKeys.clothing.tr(),

                        // 'Clothing',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateAndDisplaySelection(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/filter_icon.svg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 108,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    width: 375,
                    height: 44,
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          query = val;
                          print(query);
                        });
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: LocaleKeys.home_searchbar
                            .tr(), //'What are you looking for',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: 10,
              itemExtent: 88,
              scrollDirection: Axis.horizontal,
              itemBuilder: (
                context,
                index,
              ) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                    child: Container(
                      height: 26,
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 4,
                        bottom: 4,
                      ),
                      // width: 88,
                      // height: 88,
                      decoration: BoxDecoration(
                        color: _selectedTab == index
                            ? AppColors.yellow
                            : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          LocaleKeys.all.tr(), //'All',
                          style: TextStyle(
                            color: _selectedTab == index
                                ? Colors.white
                                : AppColors.darkGreyText,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    // '${snapshot.data?.docs.length}
                    '${LocaleKeys.items.tr()}',
                    style: const TextStyle(
                      fontSize: 19,
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.sort_by.tr(),
                      // 'Sort by:',
                      style: const TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    PopupMenuButton<String>(
                      itemBuilder: (context) {
                        return dropButtonItems.map((str) {
                          return PopupMenuItem(
                            value: str,
                            child: Text(str),
                          );
                        }).toList();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(_currentItemSelected),
                          //Icon(Icons.arrow_drop_down),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                      onSelected: (v) {
                        setState(() {
                          print('!!!===== ');
                          _currentItemSelected = v;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Expanded(
            child: ItemGridView(
              collectRef: collectionRef,
              scrollDirections: Axis.vertical,
            ),
          ),
        ]),
      ),
    );
  }
}
