import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/models/cart.dart';
import 'package:ecom_app/domain/reposittories/login/phone_auth_repository.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_screen.dart';
import 'package:ecom_app/ui/cart/check_out_screen/check_out_screen.dart';
import 'package:ecom_app/ui/home/filter_screen/filter_screen.dart';
import 'package:ecom_app/ui/home/home_screen/home_screen.dart';
import 'package:ecom_app/ui/login/bloc/phone_auth_bloc.dart';
import 'package:ecom_app/ui/login/enter_phone_screen/enter_phone_screen.dart';

import 'package:ecom_app/ui/login/get_started_screen/get_started_screen.dart';
import 'package:ecom_app/ui/login/verefication_screen/verification_screen.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_screen.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();

  // await Firebase.initializeApp();
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
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('uk'),
          Locale('es'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.mainAppNav,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/enter_phone_screen': (context) => const EnterPhoneScreen(),
        '/pin_virification_screen': (context) => const VerificationScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/home_screen/product_screen': (context) => const ProductScreen(),
        '/home_screen/cart_screen': (context) => const CartScreen(),
        '/home_screen/cart_screen/check_out_screen': (context) =>
            const CheckOutScreen(),
        '/home_screen/catalogue_screen/clothing_screen/filter_screen':
            (context) => const FilterScreen(),
      },
    );
  }
}
