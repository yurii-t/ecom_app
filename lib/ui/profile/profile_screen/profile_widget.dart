import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body:Center(
          child:Text('Profile')
        )
      )
    );
  }
}