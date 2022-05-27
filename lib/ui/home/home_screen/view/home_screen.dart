import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecom_app/routes/app_router.gr.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          HomeRouter(),
          CatalogueRouter(),
          FavoriteRouter(),
          ProfileRouter(),
        ],
        backgroundColor: AppColors.backGround,
        bottomNavigationBuilder: (_, tabsRouter) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 19,
                  top: 12,
                  right: 135,
                  bottom: 34,
                ),
                width: MediaQuery.of(context).size.width,
                height: 87,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        tabsRouter.setActiveIndex(0);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: tabsRouter.activeIndex == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/home_fill.svg',
                                ),
                                Text(
                                  LocaleKeys.home.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.bottomBarText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset('assets/icons/home_out.svg'),
                                Text(
                                  LocaleKeys.home.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greyText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        tabsRouter.setActiveIndex(1);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: tabsRouter.activeIndex == 1
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/catalogue_fill.svg',
                                ),
                                Text(
                                  LocaleKeys.catalogue.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.bottomBarText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/catalogue_out.svg',
                                ),
                                Text(
                                  LocaleKeys.catalogue.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greyText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        tabsRouter.setActiveIndex(2);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: tabsRouter.activeIndex == 2
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/favorite_fill.svg',
                                ),
                                Text(
                                  LocaleKeys.favorite.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.bottomBarText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/favorite_out.svg',
                                ),
                                Text(
                                  LocaleKeys.favorite.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greyText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        tabsRouter.setActiveIndex(3);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: tabsRouter.activeIndex == 3
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/profile_fill.svg',
                                ),
                                Text(
                                  LocaleKeys.profile.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.bottomBarText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/profile_out.svg',
                                ),
                                Text(
                                  LocaleKeys.profile.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greyText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 273,
                bottom: 42,
                right: 0,
                child: GestureDetector(
                  onTap: () => context.router.pushNamed('cart'),
                  child: Container(
                    width: 116,
                    height: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                      ),
                      gradient: AppGradient.purpleGradient,
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/shopping_cart_1.svg'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocSelector<CartBloc, CartState, num>(
                                selector: (state) => state is CartLoaded
                                    ? state.cartItems.fold(
                                        0,
                                        (previousValue, element) =>
                                            previousValue +
                                            (element.price * element.quantity),
                                      )
                                    : 0,
                                builder: (
                                  context,
                                  totalSum,
                                ) {
                                  return Text(
                                    '\$ ${totalSum.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                    ),
                                  );
                                },
                              ),
                              BlocSelector<CartBloc, CartState, int>(
                                selector: (state) => state is CartLoaded
                                    ? state.cartItems.length
                                    : 0,
                                builder: (context, length) {
                                  return Text(
                                    '${length} ${LocaleKeys.items.tr()}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder<void> {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
