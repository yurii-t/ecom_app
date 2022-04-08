import 'package:flutter/material.dart';

class CatalogueWidget extends StatefulWidget {
  CatalogueWidget({Key? key}) : super(key: key);

  @override
  State<CatalogueWidget> createState() => _CatalogueWidgetState();
}

class _CatalogueWidgetState extends State<CatalogueWidget> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(child: Text('Catalogue')),
      ),
    );
  }
}