import 'package:ecom_app/style/app_colors.dart';
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
            backgroundColor: AppColors.backGroundColor,
            body: Column(
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
                                  color: Colors.white, shape: BoxShape.circle),
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
                                      color: Colors.white),
                                ),
                                Text(
                                  '+38 (099) 123 45 67',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
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
                                primary: Colors.white),
                            child: SvgPicture.asset('icons/pencil.svg')),
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(300.0)),
                    gradient: AppColors.purpleGradient,
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
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    icon: SvgPicture.asset('icons/location.svg'),
                    label: const Text(
                      'Shipping Addresses',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkTextColor),
                    )),
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
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    icon: SvgPicture.asset('icons/creditcard.svg'),
                    label: const Text(
                      'Payment Methods',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkTextColor),
                    )),
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
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    icon: SvgPicture.asset('icons/clipboard.svg'),
                    label: const Text(
                      'Orders ',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkTextColor),
                    )),
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
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    icon: SvgPicture.asset('icons/profile_heart.svg'),
                    label: const Text(
                      'Favorite',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkTextColor),
                    )),
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
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    icon: SvgPicture.asset('icons/cog.svg'),
                    label: const Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkTextColor),
                    )),
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
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    icon: SvgPicture.asset('icons/logout.svg'),
                    label: const Text(
                      'Log Out',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkTextColor),
                    )),
                const SizedBox(
                  height: 104,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkTextColor),
                        )),
                  ),
                )
              ],
            )));
  }
}
