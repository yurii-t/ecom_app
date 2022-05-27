// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i16;

import '../ui/cart/cart_screen/cart_screen.dart' as _i14;
import '../ui/cart/check_out_screen/view/check_out_screen.dart' as _i15;
import '../ui/home/catalogue_screen/catalogue_screen.dart' as _i12;
import '../ui/home/clothing_screen/view/clothing_screen.dart' as _i13;
import '../ui/home/filter_screen/filter_screen.dart' as _i7;
import '../ui/home/home_screen/view/home_content_screen_column.dart' as _i9;
import '../ui/home/home_screen/view/home_screen.dart' as _i4;
import '../ui/login/view/enter_phone_screen/enter_phone_screen.dart' as _i2;
import '../ui/login/view/get_started_screen/get_started_screen.dart' as _i1;
import '../ui/login/view/verefication_screen/verification_screen.dart' as _i3;
import '../ui/product_screen/view/product_screen.dart' as _i5;
import '../ui/profile/favorite_screen/view/favorite_screen.dart' as _i10;
import '../ui/profile/profile_screen/profile_screen.dart' as _i11;
import '../ui/search_screen/search_screen.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    GetStartedRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i1.GetStartedScreen());
    },
    EnterPhoneRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i2.EnterPhoneScreen());
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return _i6.MaterialPageX<void>(
          routeData: routeData,
          child: _i3.VerificationScreen(
              phone: args.phone, verId: args.verId, key: args.key));
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i6.MaterialPageX<void>(
          routeData: routeData,
          child: _i5.ProductScreen(productId: args.productId, key: args.key));
    },
    CartRouter.name: (routeData) {
      return _i6.CustomPage<void>(
          routeData: routeData,
          child: const _i6.EmptyRouterPage(),
          transitionsBuilder: _i6.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i6.MaterialPageX<void>(
          routeData: routeData,
          child:
              _i7.FilterScreen(searchQuery: args.searchQuery, key: args.key));
    },
    SearchRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i8.SearchScreen());
    },
    HomeRouter.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i9.HomeContentScreenColumn());
    },
    CatalogueRouter.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    FavoriteRouter.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i10.FavoriteScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i11.ProfileScreen());
    },
    CatalogueRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i12.CatalogueScreen());
    },
    ClothingRoute.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i13.ClothingScreen());
    },
    CartScreen.name: (routeData) {
      return _i6.MaterialPageX<void>(
          routeData: routeData, child: const _i14.CartScreen());
    },
    CheckOutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckOutRouteArgs>();
      return _i6.MaterialPageX<void>(
          routeData: routeData,
          child: _i15.CheckOutScreen(itemPrice: args.itemPrice, key: args.key));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(GetStartedRoute.name, path: '/'),
        _i6.RouteConfig(EnterPhoneRoute.name, path: '/enter-phone-screen'),
        _i6.RouteConfig(VerificationRoute.name, path: '/verification-screen'),
        _i6.RouteConfig(HomeRoute.name, path: '/home-screen', children: [
          _i6.RouteConfig(HomeRouter.name,
              path: 'home-content-screen-column', parent: HomeRoute.name),
          _i6.RouteConfig(CatalogueRouter.name,
              path: 'catalogue',
              parent: HomeRoute.name,
              children: [
                _i6.RouteConfig(CatalogueRoute.name,
                    path: '', parent: CatalogueRouter.name),
                _i6.RouteConfig(ClothingRoute.name,
                    path: 'clothing', parent: CatalogueRouter.name),
                _i6.RouteConfig('*#redirect',
                    path: '*',
                    parent: CatalogueRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i6.RouteConfig(FavoriteRouter.name,
              path: 'favorite-screen', parent: HomeRoute.name),
          _i6.RouteConfig(ProfileRouter.name,
              path: 'profile-screen', parent: HomeRoute.name)
        ]),
        _i6.RouteConfig(ProductRoute.name, path: '/product-screen'),
        _i6.RouteConfig(CartRouter.name, path: 'cart', children: [
          _i6.RouteConfig(CartScreen.name, path: '', parent: CartRouter.name),
          _i6.RouteConfig(CheckOutRoute.name,
              path: 'checkout', parent: CartRouter.name),
          _i6.RouteConfig('*#redirect',
              path: '*',
              parent: CartRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i6.RouteConfig(FilterRoute.name, path: '/filter-screen'),
        _i6.RouteConfig(SearchRoute.name, path: '/search-screen')
      ];
}

/// generated route for
/// [_i1.GetStartedScreen]
class GetStartedRoute extends _i6.PageRouteInfo<void> {
  const GetStartedRoute() : super(GetStartedRoute.name, path: '/');

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [_i2.EnterPhoneScreen]
class EnterPhoneRoute extends _i6.PageRouteInfo<void> {
  const EnterPhoneRoute()
      : super(EnterPhoneRoute.name, path: '/enter-phone-screen');

  static const String name = 'EnterPhoneRoute';
}

/// generated route for
/// [_i3.VerificationScreen]
class VerificationRoute extends _i6.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute(
      {required String phone, required String verId, _i16.Key? key})
      : super(VerificationRoute.name,
            path: '/verification-screen',
            args: VerificationRouteArgs(phone: phone, verId: verId, key: key));

  static const String name = 'VerificationRoute';
}

class VerificationRouteArgs {
  const VerificationRouteArgs(
      {required this.phone, required this.verId, this.key});

  final String phone;

  final String verId;

  final _i16.Key? key;

  @override
  String toString() {
    return 'VerificationRouteArgs{phone: $phone, verId: $verId, key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-screen', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ProductScreen]
class ProductRoute extends _i6.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({required String productId, _i16.Key? key})
      : super(ProductRoute.name,
            path: '/product-screen',
            args: ProductRouteArgs(productId: productId, key: key));

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({required this.productId, this.key});

  final String productId;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ProductRouteArgs{productId: $productId, key: $key}';
  }
}

/// generated route for
/// [_i6.EmptyRouterPage]
class CartRouter extends _i6.PageRouteInfo<void> {
  const CartRouter({List<_i6.PageRouteInfo>? children})
      : super(CartRouter.name, path: 'cart', initialChildren: children);

  static const String name = 'CartRouter';
}

/// generated route for
/// [_i7.FilterScreen]
class FilterRoute extends _i6.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({required String searchQuery, _i16.Key? key})
      : super(FilterRoute.name,
            path: '/filter-screen',
            args: FilterRouteArgs(searchQuery: searchQuery, key: key));

  static const String name = 'FilterRoute';
}

class FilterRouteArgs {
  const FilterRouteArgs({required this.searchQuery, this.key});

  final String searchQuery;

  final _i16.Key? key;

  @override
  String toString() {
    return 'FilterRouteArgs{searchQuery: $searchQuery, key: $key}';
  }
}

/// generated route for
/// [_i8.SearchScreen]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search-screen');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i9.HomeContentScreenColumn]
class HomeRouter extends _i6.PageRouteInfo<void> {
  const HomeRouter()
      : super(HomeRouter.name, path: 'home-content-screen-column');

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class CatalogueRouter extends _i6.PageRouteInfo<void> {
  const CatalogueRouter({List<_i6.PageRouteInfo>? children})
      : super(CatalogueRouter.name,
            path: 'catalogue', initialChildren: children);

  static const String name = 'CatalogueRouter';
}

/// generated route for
/// [_i10.FavoriteScreen]
class FavoriteRouter extends _i6.PageRouteInfo<void> {
  const FavoriteRouter() : super(FavoriteRouter.name, path: 'favorite-screen');

  static const String name = 'FavoriteRouter';
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileRouter extends _i6.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'profile-screen');

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i12.CatalogueScreen]
class CatalogueRoute extends _i6.PageRouteInfo<void> {
  const CatalogueRoute() : super(CatalogueRoute.name, path: '');

  static const String name = 'CatalogueRoute';
}

/// generated route for
/// [_i13.ClothingScreen]
class ClothingRoute extends _i6.PageRouteInfo<void> {
  const ClothingRoute() : super(ClothingRoute.name, path: 'clothing');

  static const String name = 'ClothingRoute';
}

/// generated route for
/// [_i14.CartScreen]
class CartScreen extends _i6.PageRouteInfo<void> {
  const CartScreen() : super(CartScreen.name, path: '');

  static const String name = 'CartScreen';
}

/// generated route for
/// [_i15.CheckOutScreen]
class CheckOutRoute extends _i6.PageRouteInfo<CheckOutRouteArgs> {
  CheckOutRoute({required num itemPrice, _i16.Key? key})
      : super(CheckOutRoute.name,
            path: 'checkout',
            args: CheckOutRouteArgs(itemPrice: itemPrice, key: key));

  static const String name = 'CheckOutRoute';
}

class CheckOutRouteArgs {
  const CheckOutRouteArgs({required this.itemPrice, this.key});

  final num itemPrice;

  final _i16.Key? key;

  @override
  String toString() {
    return 'CheckOutRouteArgs{itemPrice: $itemPrice, key: $key}';
  }
}
