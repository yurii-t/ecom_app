import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: ListView(children: [
          Column(
            // cross+AxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //375,
                height: 146,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 56, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Oleh Chabanov',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '+38 (099) 123 45 67',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          primary: Colors.white,
                        ),
                        child: SvgPicture.asset('assets/icons/pencil.svg'),
                      ),
                    ],
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
                height: 24,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size(343, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/location.svg'),
                label: Text(
                  LocaleKeys.shipping_addresses.tr(),
                  // 'Shipping Addresses',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size(343, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/creditcard.svg'),
                label: Text(
                  LocaleKeys.payment_methods.tr(),
                  // 'Payment Methods',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size(343, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/clipboard.svg'),
                label: Text(
                  LocaleKeys.orders.tr(),
                  // 'Orders ',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size(343, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/profile_heart.svg'),
                label: Text(
                  LocaleKeys.favorite.tr(),
                  // 'Favorite',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size(343, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/cog.svg'),
                label: Text(
                  LocaleKeys.settings.tr(),
                  // 'Settings',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size(343, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/logout.svg'),
                label: Text(
                  LocaleKeys.log_out.tr(),
                  // 'Log Out',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(
                height: 104,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      LocaleKeys.privacy_policy.tr(),
                      // 'Privacy Policy',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
