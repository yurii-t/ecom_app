import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_screen.dart';
import 'package:ecom_app/ui/home/home_screen/home_widget.dart';
import 'package:flutter/material.dart';

class PopupScreen extends StatelessWidget {
  const PopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        clipBehavior: Clip.hardEdge,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
                  gradient: AppColors.purpleGradient,
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(400),
                      bottomRight: Radius.circular(400)),
                ),
                child: Image.asset(
                  'images/check1.png',
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Succsess',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: AppColors.darkTextColor,
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Your order will be delivered soon.It can be tracked in the "Orders" section.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkTextColor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.yellowColor,
                  onPrimary: Colors.white,
                  minimumSize: const Size(373, 48),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeWidget()));
                },
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              child: const Text(
                'Go to Orders',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.greyTextColor),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ));
  }
}
