import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:ecom_app/ui/login/bloc/phone_auth_bloc.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
// +380 123456123
//123456
  bool isLoading = false;

  TextEditingController pinController = TextEditingController();
  // ..text = "123456";

  bool hasError = false;
  String currentText = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;

    String phone = args['phoneNumber'] as String;
    String verId = args['verificationId'] as String;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneAuthVerified) {
              Navigation.mainAppNav.currentState?.pushReplacementNamed(
                '/home_screen',
              );
            }

            // Show error message if any error occurs while verifying phone number and otp code
            if (state is PhoneAuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //375,
                    height: 197,

                    padding: const EdgeInsets.fromLTRB(24, 91, 60, 44),
                    child: Text(
                      LocaleKeys.verif_title.tr(),
                      // 'Verification Code',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(300)),
                      gradient: AppGradient.purpleGradient,
                    ),
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
                        color: AppColors.darkGreyText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 37),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            phone, //'+380991234567',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            LocaleKeys.change_phone_number.tr(),
                            // 'Change Phone Number',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkText,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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

                        controller: pinController,
                        onCompleted: (v) {
                          print('Completed');
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print('Allowing to paste $text');
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
                      primary: AppColors.yellow,
                      onPrimary: Colors.white,
                      minimumSize: const Size(327, 64),
                    ),
                    onPressed: () => _verifyOtp(verificationId: verId),
                    child: Text(
                      LocaleKeys.verif_button_text.tr(),
                      // 'Send Verification Code',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        LocaleKeys.verif_resend_button_text.tr(),
                        // 'Resend code',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _verifyOtp({required String verificationId}) {
    context.read<PhoneAuthBloc>().add(VerifySentOtpEvent(
          otpCode: currentText,
          verificationId: verificationId,
        ));

    @override
    void dispose() {
      pinController.dispose();

      super.dispose();
    }
  }
}
