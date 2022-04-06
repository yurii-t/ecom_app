import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationBodyWidget extends StatefulWidget {
  PinVerificationBodyWidget({Key? key}) : super(key: key);

  @override
  State<PinVerificationBodyWidget> createState() => _PinVerificationBodyWidgetState();
}

class _PinVerificationBodyWidgetState extends State<PinVerificationBodyWidget> {

   TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
  length: 6,
  obscureText: false,
  animationType: AnimationType.fade,
  pinTheme: PinTheme(
    shape: PinCodeFieldShape.underline,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    fieldWidth: 40,
    activeFillColor: Colors.white,
  ),
  animationDuration: Duration(milliseconds: 100),
  //backgroundColor: Colors.blue.shade50,
  enableActiveFill: false,
  errorAnimationController: errorController,
  controller: textEditingController,
  onCompleted: (v) {
    print("Completed");
  },
  onChanged: (value) {
    print(value);
    setState(() {
      currentText = value;
    });
  },
  beforeTextPaste: (text) {
    print("Allowing to paste $text");
    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
    //but you can show anything you want here, like your pop up saying wrong paste format or etc
    return true;
  }, appContext: context,// appContext: null,
),
    );
  }
}