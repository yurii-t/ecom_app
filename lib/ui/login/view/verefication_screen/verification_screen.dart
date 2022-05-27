import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/routes/app_router.gr.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:ecom_app/ui/login/bloc/phone_auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  final String phone;
  final String verId;
  const VerificationScreen({
    required this.phone,
    required this.verId,
    Key? key,
  }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController pinController = TextEditingController();

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneAuthVerified) {
              context.router.replace(const HomeRoute());
            }

            if (state is PhoneAuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 197,
                padding: const EdgeInsets.fromLTRB(24, 91, 60, 44),
                child: Text(
                  LocaleKeys.verif_title.tr(),
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
                        widget.phone,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkText,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text(
                        LocaleKeys.change_phone_number.tr(),
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
                    keyboardType: TextInputType.number,
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
                    enableActiveFill: false,
                    controller: pinController,
                    onCompleted: (v) {
                      print('Completed');
                    },
                    onChanged: print,
                    beforeTextPaste: (text) {
                      print('Allowing to paste $text');

                      return true;
                    },
                    appContext: context,
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
                onPressed: () => _verifyOtp(verificationId: widget.verId),
                child: Text(
                  LocaleKeys.verif_button_text.tr(),
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
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greyText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyOtp({required String verificationId}) {
    context.read<PhoneAuthBloc>().add(VerifySentOtpEvent(
          otpCode: pinController.text,
          verificationId: verificationId,
        ));
  }
}
