import 'package:auto_route/auto_route.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_screen.dart';
import 'package:ecom_app/ui/cart/check_out_screen/view/check_out_screen.dart';
import 'package:ecom_app/ui/home/catalogue_screen/catalogue_screen.dart';
import 'package:ecom_app/ui/home/clothing_screen/view/clothing_screen.dart';
import 'package:ecom_app/ui/home/filter_screen/filter_screen.dart';
import 'package:ecom_app/ui/home/home_screen/view/home_content_screen_column.dart';
import 'package:ecom_app/ui/home/home_screen/view/home_screen.dart';
import 'package:ecom_app/ui/login/view/enter_phone_screen/enter_phone_screen.dart';
import 'package:ecom_app/ui/login/view/get_started_screen/get_started_screen.dart';
import 'package:ecom_app/ui/login/view/verefication_screen/verification_screen.dart';
import 'package:ecom_app/ui/product_screen/view/product_screen.dart';
import 'package:ecom_app/ui/profile/favorite_screen/view/favorite_screen.dart';
import 'package:ecom_app/ui/profile/profile_screen/profile_screen.dart';
import 'package:ecom_app/ui/search_screen/search_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(page: GetStartedScreen, initial: true),
    AutoRoute<void>(page: EnterPhoneScreen),
    AutoRoute<void>(page: VerificationScreen),
    AutoRoute<void>(
      page: HomeScreen,
      children: [
        AutoRoute<void>(
          name: 'HomeRouter',
          page: HomeContentScreenColumn,
        ),
        AutoRoute<void>(
          path: 'catalogue',
          name: 'CatalogueRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute<void>(path: '', page: CatalogueScreen),
            AutoRoute<void>(path: 'clothing', page: ClothingScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute<void>(name: 'FavoriteRouter', page: FavoriteScreen),
        AutoRoute<void>(name: 'ProfileRouter', page: ProfileScreen),
      ],
    ),
    AutoRoute<void>(page: ProductScreen),
    // AutoRoute<void>(page: CartScreen),
    CustomRoute<void>(
      path: 'cart',
      name: 'cartRouter',
      page: EmptyRouterPage, //CartScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      children: [
        AutoRoute<void>(path: '', page: CartScreen, name: 'cartScreen'),
        AutoRoute<void>(path: 'checkout', page: CheckOutScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    // AutoRoute<void>(page: CheckOutScreen),
    AutoRoute<void>(page: FilterScreen),
    AutoRoute<void>(page: SearchScreen),
  ],
)
class $AppRouter {}
