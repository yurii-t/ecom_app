import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/cart/check_out_screen/check%20_out_popup_dialog.dart';

import 'package:ecom_app/ui/cart/widgets/delivery_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool picked = true;
  String customerName = 'Oleh Chabanov';
  String address = '225 Highland Ave Springfield, IL 62704, USA';
  String cardNumber = '5678 5678 5678 5678';
  int delivery = 0;

  @override
  Widget build(BuildContext context) {
    final itemPrice = ModalRoute.of(context)?.settings.arguments as num;
    final num totalPrice = itemPrice + delivery;

    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: ListView(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 88,
          decoration: const BoxDecoration(
            gradient: AppGradient.purpleGradient,
          ),
          padding: const EdgeInsets.only(left: 16),
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
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/arrow_left.svg',
                color: Colors.transparent,
              ),
            ],
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
                        style: const TextStyle(
                          color: AppColors.darkText,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      GestureDetector(
                        onTap: null,
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
          child: DeliveryPicker(
            onDeliveryPickedPrice: (val) {
              setState(() {
                delivery = val;
              });
            },
          ),
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
                    FutureBuilder<dynamic>(
                      future: FireBaseStorageService().getImg('mastercard.png'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Image.network(snapshot.data.toString());
                        }

                        return const Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
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
                    style: const TextStyle(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: SvgPicture.asset('assets/icons/arrow_right.svg'),
                  ),
                ],
              ),
            ],
          ),
        ),
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
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyText,
                    ),
                  ),
                ),
                Text(
                  '\$$itemPrice',
                  style: const TextStyle(
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
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyText,
                    ),
                  ),
                ),
                Text(
                  '$delivery',
                  style: const TextStyle(
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
                Text(
                  '\$$totalPrice',
                  style: const TextStyle(
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
                final CollectionReference collectionRef =
                    FirebaseFirestore.instance.collection('checkout');
                collectionRef.doc().set({
                  'CustomerName': customerName,
                  'address': address,
                  'delivery': delivery,
                  'cardNumber': cardNumber,
                  'totalPrice': totalPrice,
                });

                showDialog<Dialog>(
                  context: context,
                  builder: (context) {
                    return const CheckOutPopupDialog();
                  },
                );
              },
              child: Text(
                LocaleKeys.pay.tr(),
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
