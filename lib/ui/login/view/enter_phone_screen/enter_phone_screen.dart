import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:ecom_app/ui/login/bloc/phone_auth_bloc.dart';

import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({Key? key}) : super(key: key);

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final TextEditingController _controller = TextEditingController();
  String initialCountry = 'UA';
  PhoneNumber number = PhoneNumber(isoCode: 'UA');

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;
  String testNumber = '';

  // @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocSelector<PhoneAuthBloc, PhoneAuthState, bool>(
          selector: (state) {
            if (state is PhoneAuthCodeSentSuccess) {
              Navigation.mainAppNav.currentState?.pushNamed(
                '/pin_virification_screen',
                arguments: {
                  'verificationId': state.verificationId,
                  'phoneNumber': testNumber,
                },
              );
            }
            if (state is PhoneAuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }

            return state is PhoneAuthLoading;
          },

          builder: (context, showLoading) {
            return showLoading
                ? const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    ),
                  )
                :

                // BlocListener<PhoneAuthBloc, PhoneAuthState>(
                //   listener: (context, state) {
                //     if (state is PhoneAuthCodeSentSuccess) {
                //       Navigation.mainAppNav.currentState?.pushNamed(
                //         '/pin_virification_screen',
                //         arguments: {
                //           'verificationId': state.verificationId,
                //           'phoneNumber': testNumber,
                //         },
                //       );
                //     }

                //     if (state is PhoneAuthError) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text(state.error),
                //         ),
                //       );
                //     }
                //   },
                // child:
                // return BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                //   builder: (context, state) {
                //     if (state is PhoneAuthLoading) {
                //       return const Center(
                //         child: SizedBox(
                //           width: 24,
                //           height: 24,
                //           child: CircularProgressIndicator(),
                //         ),
                //       );
                //     }

                //return
                Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 197,
                        padding: const EdgeInsets.fromLTRB(24, 91, 60, 44),
                        child: Text(
                          LocaleKeys.phone_verif_title.tr(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(300),
                          ),
                          gradient: AppGradient.purpleGradient,
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Text(
                          LocaleKeys.phone_verif_subtitle.tr(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(96, 90, 101, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (number) {
                            print(number.phoneNumber);
                            testNumber = number.phoneNumber ?? '';
                            print('TESTTTT$testNumber');
                          },

                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            setSelectorButtonAsPrefixIcon: true,
                            leadingPadding: 20,
                            trailingSpace: false,
                          ),
                          hintText: '(99) 999 99 99',
                          maxLength: 20, //10,
                          textStyle: const TextStyle(fontSize: 19),

                          spaceBetweenSelectorAndTextField: 0,
                          ignoreBlank: true,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                          initialValue: number,
                          textFieldController: _controller, // controller,
                          formatInput: true,
                          keyboardType: TextInputType.phone,

                          inputBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                        onPressed: _sendOtp,
                        child: Text(
                          LocaleKeys.phone_button_texrt.tr(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkGreyText,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: TextButton(
                          onPressed: () {
                            Navigation.mainAppNav.currentState!
                                .pushReplacementNamed(
                              '/home_screen',
                            );
                          },
                          child: Text(
                            LocaleKeys.phone_skip_button_text.tr(),
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
          //  ),
        ),
      ),
    );
  }

  void _sendOtp() {
    final phoneNumberWithCode = testNumber;
    context.read<PhoneAuthBloc>().add(
          SendOtpToPhoneEvent(
            phoneNumber: phoneNumberWithCode,
          ),
        );
  }
}
