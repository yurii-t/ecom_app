import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/domain/repositories/product/product_repository.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/profile/favorite_screen/bloc/favorite_screen_bloc.dart';
import 'package:ecom_app/ui/widgets/item_container.dart';

import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:ecom_app/ui/widgets/sort_popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoriteScreenBloc(productRepository: ProductRepository())
            ..add(FavoriteScreenLoadProduct()),
      child: Scaffold(
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
                            Navigation.mainListNav.currentState!
                                .popAndPushNamed(
                              'home_screen/home_content_screen',
                            );
                          },
                          child:
                              SvgPicture.asset('assets/icons/arrow_left.svg'),
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
                    child: GridView.builder(
                      itemCount: state.products.length,
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

                          context.read<FavoriteScreenBloc>().add(
                                FavoriteScreenProductFavoriteUpdate(
                                  state.products[index],
                                  !isFav,
                                  state.products,
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
            ;

            return const Text('Error');
          },
        ),
      ),
    );
  }
}
