import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Container(width: 100,height: 100,color: Colors.red,),),
      ),
    );
  }
}