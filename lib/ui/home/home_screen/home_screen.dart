import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_screen.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_screen.dart';
import 'package:ecom_app/ui/home/home_screen/home_content_screen.dart';

import 'package:ecom_app/ui/profile/favorite_screen/favorite_screen.dart';
import 'package:ecom_app/ui/profile/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: IndexedStack(
          index: _selectedTab,
          children: const [
            HomeContentScreen(),
            CatalogueScreen(),
            FavoriteScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Stack(clipBehavior: Clip.none, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 87,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 19,
                top: 12,
                right: 135,
                bottom: 34,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    }, // => onSelectedTab,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _selectedTab == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  Icon(Icons.home),
                              SvgPicture.asset(
                                'assets/icons/home_fill.svg',
                                // color: Colors.purple,
                              ),

                              Text(
                                LocaleKeys.home.tr(),
                                // 'Home',
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
                              //Icon(Icons.home_outlined),
                              SvgPicture.asset('assets/icons/home_out.svg'),
                              Text(
                                LocaleKeys.home.tr(),
                                // 'Home',
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
                      setState(() {
                        _selectedTab = 1;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _selectedTab == 1
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  Icon(Icons.home),
                              SvgPicture.asset(
                                'assets/icons/catalogue_fill.svg',
                              ),
                              Text(
                                LocaleKeys.catalogue.tr(),
                                // 'Catalogue',
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
                              //Icon(Icons.home_outlined),
                              SvgPicture.asset(
                                'assets/icons/catalogue_out.svg',
                              ),
                              Text(
                                LocaleKeys.catalogue.tr(),
                                // 'Catalogue',
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
                      setState(() {
                        _selectedTab = 2;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _selectedTab == 2
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  Icon(Icons.home),
                              SvgPicture.asset(
                                'assets/icons/favorite_fill.svg',
                              ),
                              Text(
                                LocaleKeys.favorite.tr(),
                                // 'Favorite',
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
                              //Icon(Icons.home_outlined),
                              SvgPicture.asset(
                                'assets/icons/favorite_out.svg',
                              ),
                              Text(
                                LocaleKeys.favorite.tr(),
                                // 'Favorite',
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
                      setState(() {
                        _selectedTab = 3;
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: _selectedTab == 3
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  Icon(Icons.home),
                              SvgPicture.asset(
                                'assets/icons/profile_fill.svg',
                              ),
                              Text(
                                LocaleKeys.profile.tr(),
                                // 'Profile',
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
                              //Icon(Icons.home_outlined),
                              SvgPicture.asset(
                                'assets/icons/profile_out.svg',
                              ),
                              Text(
                                LocaleKeys.profile.tr(),
                                // 'Profile',
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
          ),
          Positioned(
            left: 273,
            bottom: 42,
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.push<void>(
                context,
                SlideRightRoute(page: const CartScreen()),
              ),
              child: Container(
                width: 116,
                height: 56,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                  ),
                  gradient: AppGradient.purpleGradient,
                  // LinearGradient(
                  //   colors: [
                  //     Color.fromRGBO(52, 40, 60, 1),
                  //     Color.fromRGBO(132, 95, 161, 1),
                  //   ],
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  // ),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/shopping_cart_1.svg'),
                      // const Icon(
                      //   Icons.shopping_cart_outlined,
                      //   color: Colors.white,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            r'$239.50',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            '2 ${LocaleKeys.items.tr()}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
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
