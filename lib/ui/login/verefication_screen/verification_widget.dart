import 'dart:async';

import 'package:ecom_app/ui/home/home_screen/home_widget.dart';
import 'package:ecom_app/ui/login/verefication_screen/pin_verification_body_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationVWidget extends StatefulWidget {
  String phone;
  VerificationVWidget({Key? key, required this.phone}) : super(key: key);

  @override
  State<VerificationVWidget> createState() => _VerificationVWidgetState();
}

class _VerificationVWidgetState extends State<VerificationVWidget> {
  Color yellowColor = const Color.fromRGBO(231, 185, 68, 1);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formphonedKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();
// +380 1234567
//123456
  bool isLoading = false;

  late String verificationId;

  TextEditingController pinController = TextEditingController();
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

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.text,
      verificationCompleted: (PhoneAuthCredential crandential) async {
        await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: pinController.text))
            .then((value) {
          if (value.user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeWidget()));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar(
          'Error',
        ));
      },
      codeSent: (String verID, int? resentToke) {
        setState(() {
          pinController.text = verID;
        });
      },
      codeAutoRetrievalTimeout: (String verID) {
        setState(() {
          pinController.text = verID;
        });
      },
      timeout: const Duration(seconds: 60),
    );
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //375,
              height: 197,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(24, 91, 60, 44),
                child: Text(
                  'Verification Code',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(300.0)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(52, 40, 60, 1),
                    Color.fromRGBO(132, 95, 161, 1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, right: 160),
              child: Text(
                'Please enter Code sent to ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(96, 90, 101, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 37),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.phone, //'+380991234567',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Change Phone Number',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(52, 40, 62, 1),
                            decoration: TextDecoration.underline,
                          )))
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 24,right: 24),
            //   child: PinVerificationBodyWidget(),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Center(
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
                  controller: pinController,
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
                  },
                  appContext: context, // appContext: null,
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: yellowColor,
                  onPrimary: Colors.white,
                  minimumSize: const Size(327, 64),
                ),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: pinController.text))
                        .then((value) {
                      if (value.user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeWidget()));
                      }
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar(
                      'Error',
                    ));
                  }

                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterPhoneWidget()));
                },
                child: const Text(
                  'Send Verification Code',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Resend code',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(155, 155, 155, 1),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  // void verifyOTP() async {

  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);

  //   await auth.signInWithCredential(credential).then((value){
  //     print("You are logged in successfully");

  //   });
  // }

}
