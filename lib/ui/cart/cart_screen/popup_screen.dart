import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_screen.dart';
import 'package:ecom_app/ui/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class PopupScreen extends StatelessWidget {
  const PopupScreen({Key? key}) : super(key: key);

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
                // shape: BoxShape.circle,
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
            // 'Succsess',
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
              // 'Your order will be delivered soon.It can be tracked in the "Orders" section.',
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
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Text(
                LocaleKeys.popup_button_text.tr(),
                // 'Continue Shopping',
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
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            child: Text(
              LocaleKeys.popup_textbutton.tr(),
              // 'Go to Orders',
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
