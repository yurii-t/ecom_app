import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/profile/favorite_screen/bloc/favorite_screen_bloc.dart';
import 'package:ecom_app/ui/widgets/item_container.dart';

import 'package:ecom_app/ui/widgets/item_grid_view.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:ecom_app/ui/widgets/sort_popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Stream<QuerySnapshot> favoriteProductCollRef = FirebaseFirestore
    //     .instance
    // .collection('products')
    // .where('isFavorite', isEqualTo: true)
    // .snapshots();

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: BlocBuilder<FavoriteScreenBloc, FavoriteScreenState>(
        builder: (context, state) {
          if (state is FavoriteScreenLoading) {
            return const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is FavoriteScreenLoaded) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 88,
                  decoration: const BoxDecoration(
                    gradient: AppGradient.purpleGradient,
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigation.mainListNav.currentState!.popAndPushNamed(
                            'home_screen/home_content_screen',
                          );
                          // Future.delayed(Duration.zero, () {
                          //   Navigator.pop(context);
                          // });

                          //  Navigator.of(context).pop();
                          // Navigation.mainListNav.currentState?.pop();
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
                      SvgPicture.asset(
                        'assets/icons/arrow_left.svg',
                        color: Colors.transparent,
                      ),
                    ],
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
                  height: 16,
                ),
                Expanded(
                  // child: ItemGridView(
                  //   physics: AlwaysScrollableScrollPhysics(),
                  //   products: [],
                  //   func1: () {},
                  // ),
                  child: GridView.builder(
                    //scrollDirection: //scrollDirections,
                    itemCount: state.products.length,
                    // products
                    //     .length, //state.products.length, //snapshot.data?.docs.length, //6,
                    // physics: const NeverScrollableScrollPhysics(),
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

                        context.read<FavoriteScreenBloc>().add(
                              FavoriteScreenProductFavoriteUpdate(
                                state.products[index], // state.products.first,
                                !isFav,
                                state.products,
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
              ],
            );
          }
          ;

          return const Text('Error');
        },
      ),
    );
  }
}
