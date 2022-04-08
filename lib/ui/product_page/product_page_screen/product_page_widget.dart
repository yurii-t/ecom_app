import 'package:flutter/material.dart';

class ProdutPageWidget extends StatefulWidget {
  ProdutPageWidget({Key? key}) : super(key: key);

  @override
  State<ProdutPageWidget> createState() => _ProdutPageWidgetState();
}

class _ProdutPageWidgetState extends State<ProdutPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(child: Text('product page')),
      ),
    );
  }
}