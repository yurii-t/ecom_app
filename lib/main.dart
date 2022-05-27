import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecom_app/blocs/catalogue/bloc/catalogue_screen_bloc.dart';

import 'package:ecom_app/domain/repositories/cart/cart_repository.dart';
import 'package:ecom_app/domain/repositories/catalogue/catalogue_repository.dart';
import 'package:ecom_app/domain/repositories/login/phone_auth_repository.dart';
import 'package:ecom_app/domain/repositories/product/product_repository.dart';
import 'package:ecom_app/routes/app_router.gr.dart';

import 'package:ecom_app/ui/home/clothing_screen/bloc/clothing_screen_bloc.dart';

import 'package:ecom_app/ui/home/home_screen/bloc/home_screen_bloc.dart';

import 'package:ecom_app/ui/login/bloc/phone_auth_bloc.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [
      EasyLocalization.ensureInitialized(),
      Firebase.initializeApp(),
    ],
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PhoneAuthBloc(phoneAuthRepository: PhoneAuthRepository()),
        ),
        BlocProvider(
          create: (context) =>
              HomeScreenBloc(productRepository: ProductRepository())
                ..add(HomeScreenLoadProduct()),
        ),
        BlocProvider(
          create: (context) =>
              CatalogueScreenBloc(catalogueRepository: CatalogueRepository())
                ..add(CatalogueScreenLoad()),
        ),
        BlocProvider(
          create: (context) =>
              ClothingScreenBloc(productRepository: ProductRepository())
                ..add(ClothingScreenLoadProduct()),
        ),
        BlocProvider(
          create: (context) =>
              CartBloc(cartRepository: CartRepository())..add(LoadCart()),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('uk'),
          Locale('es'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
