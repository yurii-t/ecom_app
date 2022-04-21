import 'package:easy_localization/easy_localization.dart';

import 'package:ecom_app/ui/login/get_started_screen/get_started_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('uk'),
        Locale('es'),
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home:
          // CheckOutScreen(),
          // CartScreen(),
          // FavoriteScreen(),
          //ProfileWidget(),
          // ProdutPageWidget(),
          // FilterWidget(),
          //ClothingWidget(),
          // HomeWidget(),
          const GetStartedScreen(),

      // initialRoute: '/',
      //   routes: {

      //   '/': (context) => const GetStartedWidget(),

      //   '/enter_phone_screen': (context) => const EnterPhoneWidget(),
      //   '/pin_virification_screen': (context) => const VerificationVWidget(phone: '',),
      //   '/home_screen': (context) => const HomeWidget(),
      //   '/catalogue_screen': (context) => const CatalogueWidget(),
      //   '/categories_screen': (context) => const CategoriesWidget(),
      //     '/clothing_screen': (context) => const ClothingWidget(),
      //   '/filter_screen': (context) => const FilterWidget(),
      //   '/cart_screen': (context) => const CartWidget(),
      // },
    );
  }
}
