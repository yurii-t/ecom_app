import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/models/product.dart';

import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/catalogue_screen/catalogue_screen.dart';
import 'package:ecom_app/ui/home/home_screen/bloc/home_screen_bloc.dart';

import 'package:ecom_app/ui/home/home_screen/view/home_carousel_list.dart';
import 'package:ecom_app/ui/home/home_screen/view/home_catalogue_list.dart';
import 'package:ecom_app/ui/widgets/item_container.dart';

import 'package:ecom_app/ui/widgets/item_grid_view.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:ecom_app/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeContentScreenColumn extends StatelessWidget {
  const HomeContentScreenColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> productsCollRef =
        FirebaseFirestore.instance.collection('products').snapshots();
    late Product product;

    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenLoading) {
          const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is HomeScreenLoaded) {
          late bool isFav;

          return ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    height: 132,
                    decoration: const BoxDecoration(
                      gradient: AppGradient.purpleGradient,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/icons/menu_alt_2_1.svg'),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: 'My',
                                style: TextStyle(color: AppColors.yellow),
                              ),
                              TextSpan(
                                text: 'Shop',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset('assets/icons/bell_1.svg'),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 108,
                    child: SearchBar(),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 20, right: 20),
                    //   width: 375,
                    //   height: 44,
                    //   child: TextField(
                    //     textAlignVertical: TextAlignVertical.bottom,
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(40),
                    //       ),
                    //       prefixIcon: const Icon(Icons.search),
                    //       hintText: LocaleKeys.home_searchbar.tr(),
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
              const SizedBox(
                height: 34,
              ),
              const HomeCarouselList(),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.catalogue.tr(),
                      style: const TextStyle(
                        fontSize: 19,
                        color: AppColors.darkText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigation.mainListNav.currentState?.pushNamed(
                          '/home_screen/catalogue_screen',
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.see_all.tr(),
                            style: const TextStyle(
                              color: AppColors.greyText,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.greyText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeCatalogueList(),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.popular.tr(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
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
                    mainAxisExtent: 260, //260,
                    childAspectRatio: 2 / 2,
                  ),
                  itemBuilder: (context, index) {
                    _updateFavorite() {
                      bool isFav = state.products[index].isFavorite;

                      context.read<HomeScreenBloc>().add(
                            HomeScreenProductFavoriteUpdate(
                              state.products[index], // state.products.first,
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
            ],
          );
        }
        return Text('Error');
      },
    );
  }
}
