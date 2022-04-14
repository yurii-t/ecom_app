import 'dart:math';

import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_widget.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_widget.dart';
import 'package:ecom_app/ui/home/home_screen/home_screen_content_widget.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_widget.dart';
import 'package:ecom_app/ui/profile/favorite_screen/favorite_widget.dart';
import 'package:ecom_app/ui/profile/profile_screen/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: IndexedStack(
            index: _selectedTab,
            children: [
              const HomeScreenContentWidget(),
               const CatalogueWidget(),
              FavoriteWidget(),
              ProfileWidget()
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
                  padding: const EdgeInsets.only(left: 19, top: 12, right: 135,bottom: 34),
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
                                children:  [
                                //  Icon(Icons.home),
                                SvgPicture.asset('icons/home_fill.svg',
                               // color: Colors.purple,
                                ),
                              
                                   const Text('Home',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.bottomBarTextColor,fontSize: 10),)
                                ],
                              )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  //Icon(Icons.home_outlined),
                                  SvgPicture.asset('icons/home_out.svg'),
                                   const Text('Home',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.greyTextColor,fontSize: 10),)
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
                                children:  [
                                //  Icon(Icons.home),
                                SvgPicture.asset('icons/catalogue_fill.svg',color: Colors.purple,),
                                   const Text('Catalogue',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.bottomBarTextColor,fontSize: 10),)
                                ],
                              )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  //Icon(Icons.home_outlined),
                                  SvgPicture.asset('icons/catalogue_out.svg'),
                                   const Text('Catalogue',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.greyTextColor,fontSize: 10),)
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
                                children:  [
                                //  Icon(Icons.home),
                                SvgPicture.asset('icons/favorite_fill.svg',color: Colors.purple,),
                                   const Text('Favorite',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.bottomBarTextColor,fontSize: 10),)
                                ],
                              )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  //Icon(Icons.home_outlined),
                                  SvgPicture.asset('icons/favorite_out.svg'),
                                   const Text('Favorite',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.greyTextColor,fontSize: 10),)
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
                                children:  [
                                //  Icon(Icons.home),
                                SvgPicture.asset('icons/profile_fill.svg',color: Colors.purple,),
                                   const Text('Profile',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.bottomBarTextColor,fontSize: 10),)
                                ],
                              )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  //Icon(Icons.home_outlined),
                                  SvgPicture.asset('icons/profile_out.svg'),
                                   const Text('Profile',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.greyTextColor,fontSize: 10),)
                                ],
                              ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              left: 273,
              bottom: 42,
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context, SlideRightRoute(page: const CartWidget())),
                child: Container(
                  width: 116,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80)),
                    gradient: AppColors.purpleGradient,
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
                        SvgPicture.asset('icons/shopping_cart_1.svg'),
                        // const Icon(
                        //   Icons.shopping_cart_outlined,
                        //   color: Colors.white,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              ' \$239.50',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11),
                            ),
                            Text('2 items',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
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
