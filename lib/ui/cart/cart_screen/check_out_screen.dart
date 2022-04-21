import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/cart/cart_screen/popup_screen.dart';
import 'package:ecom_app/ui/cart/cart_screen/widgets/delivery_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:ecom_app/assets/translations/locale_keys.g.dart';
// assets\translations\locale_keys.g.dart

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool picked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: ListView(children: [
        Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 88,
            decoration: const BoxDecoration(
              gradient: AppGradient.purpleGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/icons/arrow_left.svg'),
                  ),
                  Text(
                    LocaleKeys.check_out.tr(),
                    // 'check_out'.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      LocaleKeys.shipping_addresses.tr(),
                      //  'Shipping Address',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            height: 92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Oleh Chabanov',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkText,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.change.tr(),
                          // 'Change ',
                          style: const TextStyle(
                            color: AppColors.darkText,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icons/arrow_right.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 165),
                  child: Text(
                    '225 Highland Ave Springfield, IL 62704, USA',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGreyText,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/delivery.svg'),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  LocaleKeys.delivery.tr(),
                  // 'Delivery',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: DeliveryPicker(availableDelivery: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/del1.png',
                      width: 71,
                      height: 16,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Text(
                      r'$15',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkText,
                      ),
                    ),
                    Text(
                      '1-2 ${LocaleKeys.days.tr()}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/del2.png',
                      width: 71,
                      height: 16,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Text(
                      r'$18',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkText,
                      ),
                    ),
                    Text(
                      '1-2 ${LocaleKeys.days.tr()}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/del3.png',
                      width: 71,
                      height: 16,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Text(
                      r'$20',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkText,
                      ),
                    ),
                    Text(
                      '1-2 ${LocaleKeys.days.tr()}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/creditcard.svg'),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      LocaleKeys.paymentmethod.tr(),
                      // 'Payment Method',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            height: 59,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/mastercard.png',
                        // width: 80,
                        // height: 80,
                      ),
                      const Text(
                        '   **** **** **** 5678',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkText,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.change.tr(),
                      // 'Change ',
                      style: const TextStyle(
                        color: AppColors.darkText,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 18),
        width: MediaQuery.of(context).size.width,
        height: 202,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.items.tr(),
                    // 'Items',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyText,
                    ),
                  ),
                ),
                const Text(
                  r'$239.98',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.delivery.tr(),
                    // 'Delivery',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyText,
                    ),
                  ),
                ),
                const Text(
                  r'$218',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.total_price.tr(),
                    // 'Total price',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
                const Text(
                  r'$239.98',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.yellow,
                onPrimary: Colors.white,
                minimumSize: const Size(373, 48),
              ),
              onPressed: () {
                showDialog<Dialog>(
                  context: context,
                  builder: (context) {
                    return const PopupScreen();
                  },
                );
              },
              child: Text(
                LocaleKeys.pay.tr(),
                // 'Pay',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
