import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:ecom_app/ui/widgets/navigation.dart';

import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: [
          FutureBuilder<dynamic>(
            future: FireBaseStorageService().getImg('start_img.gif'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    snapshot.data.toString(),
                    fit: BoxFit.fill,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return Container();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 557,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 269,
                      height: 146,
                      decoration: BoxDecoration(
                        color: AppColors.yellow.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(300),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 291,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        gradient: AppGradient.purpleGradient,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 28,
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 31,
                              ),
                              children: [
                                TextSpan(
                                  text: 'My',
                                  style: TextStyle(color: AppColors.yellow),
                                ),
                                TextSpan(
                                  text: 'Shop',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            'Lorem Ipsum is simply dummy text of the  printing and typesetting industry',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigation.mainAppNav.currentState
                                  ?.pushReplacementNamed(
                                '/enter_phone_screen',
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.yellow,
                              onPrimary: Colors.white,
                              minimumSize: const Size(239, 48),
                            ),
                            child: Text(
                              LocaleKeys.get_started.tr(),
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
