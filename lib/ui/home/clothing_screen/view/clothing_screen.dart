import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/clothing_screen/bloc/clothing_screen_bloc.dart';
import 'package:ecom_app/ui/home/filter_screen/filter_screen.dart';
import 'package:ecom_app/ui/widgets/item_container.dart';
import 'package:ecom_app/ui/widgets/item_grid_view.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:ecom_app/ui/widgets/sort_popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClothingScreen extends StatefulWidget {
  const ClothingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ClothingScreen> createState() => _ClothingScreenState();
}

class _ClothingScreenState extends State<ClothingScreen> {
  String query = '';
  late Stream<QuerySnapshot> collectionRef;
  dynamic startPrice = null;
  dynamic endPrice = null;
  int _selectedTab = 0;

  void navigateAndDisplaySelection(BuildContext context) async {
    final List<double>? result = await Navigation.mainAppNav.currentState
            ?.pushNamed(
                '/home_screen/catalogue_screen/clothing_screen/filter_screen')
        as List<double>?;
    setState(() {
      startPrice = result?[0] ?? null;
      endPrice = result?[1] ?? null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (query != '' && query != null) {
    //   collectionRef = FirebaseFirestore.instance
    //       .collection('products')
    //       .where('name', isGreaterThanOrEqualTo: query)
    //       .where('name', isLessThanOrEqualTo: '$query\uf7ff')
    //       .snapshots();
    // } else if (startPrice != null && endPrice != null) {
    //   collectionRef = FirebaseFirestore.instance
    //       .collection('products')
    //       .where('price', isGreaterThanOrEqualTo: startPrice)
    //       .where('price', isLessThanOrEqualTo: endPrice)
    //       .snapshots();
    // } else {
    //   collectionRef = FirebaseFirestore.instance
    //       .collection('products')
    //       .where('category', isEqualTo: 'Clothing')
    //       .snapshots();
    // }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: BlocBuilder<ClothingScreenBloc, ClothingScreenState>(
          builder: (context, state) {
            if (state is ClothingScreenLoading) {
              return const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ClothingScreenLoaded) {
              return ListView(children: [
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
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Navigation.mainListNav.currentState?.pop(),
                            child: SvgPicture.asset(
                              'assets/icons/arrow_left.svg',
                            ),
                          ),
                          Text(
                            LocaleKeys.clothing.tr(),
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
                    Positioned(
                      top: 108,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
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
                            hintText: LocaleKeys.home_searchbar.tr(),
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
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 26,
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 12,
                            top: 4,
                            bottom: 4,
                          ),
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
                              LocaleKeys.all.tr(),
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
                          plural(
                            LocaleKeys.item_amount,
                            state.products.length,
                          ),
                          style: const TextStyle(
                            fontSize: 19,
                            color: AppColors.darkText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SortPopupMenuButton(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                SizedBox(
                  // child: ItemGridView(
                  //   products: [],
                  //   physics: AlwaysScrollableScrollPhysics(),
                  //   func1: () {},
                  // ),
                  child: GridView.builder(
                    //scrollDirection: //scrollDirections,
                    itemCount: state.products.length,
                    // products
                    //     .length, //state.products.length, //snapshot.data?.docs.length, //6,
                    physics: const NeverScrollableScrollPhysics(),
                    //physics,
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
                      // final DocumentSnapshot? data = snapshot.data?.docs[index];
                      // final String productId = data?.id ?? '';
                      // var idx = state.products[index];
                      // var id = state.products.where((element) => element.category);
                      // return ItemContainer(data: data, productId: productId);
                      void _updateFavorite() {
                        final bool isFav = state.products[index].isFavorite;

                        context.read<ClothingScreenBloc>().add(
                              ClothingProductFavoriteUpdate(
                                state.products[index], // state.products.first,
                                !isFav,
                                // state.products.where((element) => element.isFavorite)
                                //     as bool,
                                // state.products.map((e1) => e1.isFavorite).first,
                                // state.products.map((e) => e.id).toString(),
                              ),
                            );
                      }

                      return ItemContainer(
                        product: state.products[index],
                        updateFavorite:
                            _updateFavorite, //_updateFavorite, //func1,
                      );
                    },
                  ),
                ),
              ]);
            }
            ;

            return const Text('Error');
          },
        ),
      ),
    );
  }
}
