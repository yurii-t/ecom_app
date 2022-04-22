import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String dropdownvalue = LocaleKeys.featured.tr(); //'Featured';
  List<String> dropButtonItems = [
    LocaleKeys.featured.tr(), //'Featured',
    LocaleKeys.new_text.tr(), // 'New',
    LocaleKeys.popular.tr(), // 'Popular',
    LocaleKeys.price_high_to_low.tr(), // 'Price high to low',
    LocaleKeys.price_low_to_high.tr(), // 'Price low to high',
  ];
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
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 88,
            decoration: const BoxDecoration(
              gradient: AppGradient.purpleGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 150),
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
                    LocaleKeys.favorite.tr(),
                    // 'Favorite',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Colors.white,
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
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '5 ${LocaleKeys.items.tr()}',
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
                      // 'Sort by: ',
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
                          Text('$_currentItemSelected '),
                          SvgPicture.asset('assets/icons/dropdown.svg'),
                          // const Icon(Icons.keyboard_arrow_down)
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
            height: 16,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                // var favorite =   snapshot.data!.docs
                //     .where((element) => element == ['isFavorite']);
                // if (favorite == false) {
                //   return const CircularProgressIndicator();
                // }

                return !snapshot.hasData
                    ? const CircularProgressIndicator()
                    : GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? 3
                              : 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 260,
                          childAspectRatio: 2 / 2,
                        ),
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          if (data['isFavorite'] != true) {
                            return CircularProgressIndicator();
                          }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductPageScreen(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 163,
                                      height: 163,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            data['imageUrl'].toString(),
                                          ),
                                          // AssetImage(
                                          //   'assets/images/img_content.png',
                                          // ),
                                        ),
                                      ),
                                    ),
                                    // Positioned(
                                    //   top: 8,
                                    //   child: Container(
                                    //     width: 47,
                                    //     height: 20,
                                    //     decoration: const BoxDecoration(
                                    //       borderRadius: BorderRadius.only(
                                    //         topRight: Radius.circular(40),
                                    //         bottomRight: Radius.circular(40),
                                    //       ),
                                    //       gradient: AppGradient.orangeGradient,
                                    //     ),
                                    //     child: const Center(
                                    //       child: Text(
                                    //         '-50%',
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: 11,
                                    //           fontWeight: FontWeight.w700,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
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
                                          'assets/icons/favorite_heart.svg',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        data['name'].toString(),
                                        // LocaleKeys.product_title.tr(),
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
                                      Text(
                                        '\$ ${data['price'].toString()}',
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
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
