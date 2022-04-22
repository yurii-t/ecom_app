import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/filter_screen/filter_screen.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_screen.dart';
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
  int _selectedTab = 0;
  late String _currentItemSelected;
  var _iconStar = SvgPicture.asset(
    'assets/icons/star.svg',
  );

  @override
  void initState() {
    super.initState();
    _currentItemSelected = dropButtonItems[0];
  }

  @override
  Widget build(BuildContext context) {
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
                        child: SvgPicture.asset('assets/icons/arrow_left.svg'),
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
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FilterScreen(),
                            ),
                          );
                        },
                        child: SvgPicture.asset('assets/icons/filter_icon.svg'),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '166 ${LocaleKeys.items.tr()}',
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
                    //  Icon(
                    //   Icons.chevron_right,
                    //   color:  AppColors.greyTextColor,
                    // )

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
                          print('!!!===== $v');
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
            child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 260,
                childAspectRatio: 2 / 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductPageScreen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          FutureBuilder<dynamic>(
                            future: FireBaseStorageService()
                                .getImg('img_content.png'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Container(
                                  width: 163,
                                  height: 163,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        snapshot.data.toString(),
                                      ),
                                      //  AssetImage(
                                      //   'assets/images/img_content.png',
                                    ),
                                  ),
                                );
                              }

                              return const CircularProgressIndicator();
                            },
                          ),
                          Positioned(
                            top: 8,
                            child: Container(
                              width: 47,
                              height: 20,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                gradient: AppGradient.orangeGradient,
                              ),
                              child: const Center(
                                child: Text(
                                  '-50%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 145,
                            //right: 0,
                            left: 110,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: const CircleBorder(),
                                // padding: EdgeInsets.all(36),
                              ),
                              onPressed: () {},
                              child: SvgPicture.asset(
                                'assets/icons/heart11.svg',
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _iconStar,
                                const SizedBox(
                                  width: 3,
                                ),
                                _iconStar,
                                const SizedBox(
                                  width: 3,
                                ),
                                _iconStar,
                                const SizedBox(
                                  width: 3,
                                ),
                                _iconStar,
                                const SizedBox(
                                  width: 3,
                                ),
                                _iconStar,
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              LocaleKeys.product_title.tr(),
                              // 'ECOWISH Womens Color Block Striped Draped K kslkfajklsajlk',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              r'$102.33',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}