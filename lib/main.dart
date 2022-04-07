import 'package:ecom_app/ui/home/home_screen/home_widget.dart';
import 'package:ecom_app/ui/login/get_started_screen/get_started_widget.dart';
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
      home:  GetStartedWidget(),//MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/second',
      routes: {
    
    '/second': (context) =>  HomeWidget(),
  },

    );
  }
}

