import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/models/filter.dart';
import 'package:ecom_app/routes/app_router.gr.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/clothing_screen/bloc/clothing_screen_bloc.dart';

import 'package:ecom_app/ui/widgets/item_container.dart';

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
  Filter filterValue = Filter.initial();
  TextEditingController textcontroller = TextEditingController();

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            onTap: () => context.router.pop(),
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
                            onTap: () async {
                              final value =
                                  await context.router.push(FilterRoute(
                                searchQuery: textcontroller.text,
                              ));
                              filterValue = value as Filter;
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
                          controller: textcontroller,
                          onChanged: (val) {
                            context
                                .read<ClothingScreenBloc>()
                                .add(GetFilter(filterValue, val));
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
                  child: GridView.builder(
                    itemCount: state.products.length,
                    physics: const NeverScrollableScrollPhysics(),
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
                      void _updateFavorite() {
                        final bool isFav = state.products[index].isFavorite;

                        context.read<ClothingScreenBloc>().add(
                              ClothingProductFavoriteUpdate(
                                state.products[index],
                                !isFav,
                              ),
                            );
                      }

                      return ItemContainer(
                        product: state.products[index],
                        updateFavorite: _updateFavorite,
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
