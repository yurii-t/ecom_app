import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/home_screen/home_widget.dart';
import 'package:ecom_app/ui/login/verefication_screen/pin_verification_body_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationVWidget extends StatefulWidget {
  final String phone;
  const VerificationVWidget({Key? key, required this.phone}) : super(key: key);

  @override
  State<VerificationVWidget> createState() => _VerificationVWidgetState();
}

class _VerificationVWidgetState extends State<VerificationVWidget> {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeWidget()));
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 91, 60, 44),
                child: Text(
                  LocaleKeys.verif_title.tr(),
                  // 'Verification Code',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(300.0)),
                  gradient: AppColors.purpleGradient),
            ),
            const SizedBox(
              height: 33,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 160),
              child: Text(
                LocaleKeys.verif_subtitle.tr(),
                // 'Please enter Code sent to ',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGreyTextColor,
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
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkTextColor),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(LocaleKeys.change_phone_number.tr(),
                          // 'Change Phone Number',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkTextColor,
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
                  animationDuration: const Duration(milliseconds: 100),
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
                  primary: AppColors.yellowColor,
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
                                builder: (context) => const HomeWidget()));
                      }
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar(
                      'Error',
                    ));
                  }

                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterPhoneWidget()));
                },
                child: Text(
                  LocaleKeys.verif_button_text.tr(),
                  // 'Send Verification Code',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextButton(
                  onPressed: () {},
                  child: Text(LocaleKeys.verif_resend_button_text.tr(),
                      // 'Resend code',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greyTextColor,
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
