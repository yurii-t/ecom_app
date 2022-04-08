import 'dart:math';

import 'package:ecom_app/ui/cart/cart_screen/cart_widget.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_widget.dart';
import 'package:ecom_app/ui/home/home_screen/home_screen_content_widget.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_widget.dart';
import 'package:ecom_app/ui/profile/favorite_screen/favorite_widget.dart';
import 'package:ecom_app/ui/profile/profile_screen/profile_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Color yellowColor = const Color.fromRGBO(231, 185, 68, 1);
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(244, 243, 244, 1),
          body: IndexedStack(
            index: _selectedTab,
            children: [
              HomeScreenContentWidget(),
              CatalogueWidget(),
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
                  padding: const EdgeInsets.only(left: 19, top: 12, right: 135),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTab = 0;
                          });
                        }, // => onSelectedTab,
                        splashColor: Colors.red,
                        highlightColor: Colors.blue,
                        child: _selectedTab == 0
                            ? Column(
                                children: const [
                                  Icon(Icons.home),
                                  Text('Home')
                                ],
                              )
                            : Column(
                                children: const [
                                  Icon(Icons.home_outlined),
                                  Text('Home')
                                ],
                              ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTab = 1;
                            });
                          },
                          splashColor: Colors.red,
                          highlightColor: Colors.green,
                          child: _selectedTab == 1
                              ? Column(
                                  children: const [
                                    Icon(Icons.category_outlined),
                                    Text('Catalogue')
                                  ],
                                )
                              : Column(
                                  children: const [
                                    Icon(Icons.category),
                                    Text('Catalogue')
                                  ],
                                )),
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
                                children: const [
                                  Icon(Icons.favorite_outline),
                                  Text('Favorite')
                                ],
                              )
                            : Column(
                                children: const [
                                  Icon(Icons.favorite),
                                  Text('Favorite')
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
                                children: const [
                                  Icon(Icons.person_outline),
                                  Text('Profile')
                                ],
                              )
                            : Column(
                                children: const [
                                  Icon(Icons.person),
                                  Text('Profile')
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
                    context, SlideRightRoute(page: CartWidget())),
                child: Container(
                  width: 116,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(52, 40, 60, 1),
                        Color.fromRGBO(132, 95, 161, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
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
