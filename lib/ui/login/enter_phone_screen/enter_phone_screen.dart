import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/home_screen/home_screen.dart';
import 'package:ecom_app/ui/login/verefication_screen/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({Key? key}) : super(key: key);

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'UA';
  PhoneNumber number = PhoneNumber(isoCode: 'UA');

// TextEditingController phoneController = TextEditingController(text: "+923028997122");
//   TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = '';

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
                  LocaleKeys.phone_verif_title.tr(),
                  // 'What Is Your Phone Number?',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(300)),
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
                // 'Please enter your phone number to verify your account',
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
                },

                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  setSelectorButtonAsPrefixIcon: true,
                  leadingPadding: 20,
                  trailingSpace: false,
                ),
                hintText: '(99) 999 99 99',
                maxLength: 10,
                textStyle: const TextStyle(fontSize: 19),

                spaceBetweenSelectorAndTextField: 0,
                ignoreBlank: true,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle:
                    const TextStyle(color: Colors.black, fontSize: 19),
                initialValue: number,
                textFieldController: controller, // controller,
                formatInput: true,
                keyboardType: TextInputType.phone,
                //TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),

            // SizedBox(
            //   width: 327,
            //   height:64 ,
            //   child: TextFormField(
            //     keyboardType: TextInputType.phone,
            //     autofocus: true,
            //   )),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.yellow,
                onPrimary: Colors.white,
                minimumSize: const Size(327, 64),
              ),
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationScreen(
                      phone: controller.text,
                      // phone: number.phoneNumber.toString(),
                    ),
                  ),
                );
              },
              child: Text(
                LocaleKeys.phone_button_texrt.tr(),
                // 'Send Verification Code',
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
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Text(
                  LocaleKeys.phone_skip_button_text.tr(),
                  // 'Skip',
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
    );
  }

//  void loginWithPhone() async {
//     auth.verifyPhoneNumber(
//       phoneNumber: phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential).then((value){

//           print("You are logged in successfully");
//         }

//         );
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.message);

//       },
//       codeSent: (String verificationId, int? resendToken) {
//         otpVisibility = true;
//         verificationID = verificationId;
//         setState(() {});
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {

//       },
//     );
//   }

}
