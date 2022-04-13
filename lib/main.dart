import 'package:ecom_app/ui/cart/cart_screen/cart_widget.dart';
import 'package:ecom_app/ui/home/filter_screen/filter_widget.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_widget.dart';
import 'package:ecom_app/ui/home/home_screen/categories_widget.dart';
import 'package:ecom_app/ui/home/home_screen/clothing_widget.dart';
import 'package:ecom_app/ui/home/home_screen/home_widget.dart';
import 'package:ecom_app/ui/login/enter_phone_screen/enter_phone_widget.dart';
import 'package:ecom_app/ui/login/get_started_screen/get_started_widget.dart';
import 'package:ecom_app/ui/login/verefication_screen/verification_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:  
      FilterWidget(),
      //ClothingWidget(),
     // HomeWidget(),
      ////GetStartedWidget(),
      
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

