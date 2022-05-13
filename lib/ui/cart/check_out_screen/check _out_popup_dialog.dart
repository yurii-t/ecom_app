import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_screen.dart';

import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:flutter/material.dart';

class CheckOutPopupDialog extends StatelessWidget {
  const CheckOutPopupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              height: 125,
              width: 310,
              decoration: const BoxDecoration(
                gradient: AppGradient.purpleGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(400),
                  bottomRight: Radius.circular(400),
                ),
              ),
              child: Image.asset(
                'assets/images/check1.png',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            LocaleKeys.success.tr(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              LocaleKeys.cart_popup_text.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.darkText,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.yellow,
                onPrimary: Colors.white,
                minimumSize: const Size(373, 48),
              ),
              onPressed: () {
                Navigation.mainAppNav.currentState?.popUntil(
                  ModalRoute.withName(
                    '/home_screen',
                  ),
                );
              },
              child: Text(
                LocaleKeys.popup_button_text.tr(),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Navigation.mainAppNav.currentState
                  ?.popUntil(ModalRoute.withName('/home_screen/cart_screen'));
            },
            child: Text(
              LocaleKeys.popup_textbutton.tr(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.greyText,
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
