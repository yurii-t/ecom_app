import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProfileSetting> settings = [
      ProfileSetting(
        image: 'assets/icons/location.svg',
        name: LocaleKeys.shipping_addresses.tr(),
      ),
      ProfileSetting(
        image: 'assets/icons/creditcard.svg',
        name: LocaleKeys.payment_methods.tr(),
      ),
      ProfileSetting(
        image: 'assets/icons/clipboard.svg',
        name: LocaleKeys.orders.tr(),
      ),
      ProfileSetting(
        image: 'assets/icons/profile_heart.svg',
        name: LocaleKeys.favorite.tr(),
      ),
      ProfileSetting(
        image: 'assets/icons/cog.svg',
        name: LocaleKeys.settings.tr(),
      ),
      ProfileSetting(
        image: 'assets/icons/logout.svg',
        name: LocaleKeys.log_out.tr(),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: ListView(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 146,
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
          for (final setting in settings)
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size(343, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: SvgPicture.asset(setting.image),
                label: Text(
                  setting.name,
                  // LocaleKeys.shipping_addresses.tr(),

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 104,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 36),
              child: GestureDetector(
                onTap: null,
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
        ]),
      ),
    );
  }
}

class ProfileSetting {
  final String image;
  final String name;

  ProfileSetting({required this.image, required this.name});
}
