import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/blocs/catalogue/bloc/catalogue_screen_bloc.dart';

import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:ecom_app/ui/home/clothing_screen/view/clothing_screen.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      LocaleKeys.clothing.tr(),
      LocaleKeys.shoes.tr(),
      LocaleKeys.jewelry.tr(),
      LocaleKeys.watches.tr(),
      LocaleKeys.handbags.tr(),
      LocaleKeys.accessories.tr(),
      LocaleKeys.mens_fashion.tr(),
      LocaleKeys.girls_fashion.tr(),
      LocaleKeys.boys_fashion.tr(),
    ];
    int _pageIndex = 0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: BlocBuilder<CatalogueScreenBloc, CatalogueScreenState>(
          builder: (context, state) {
            if (state is CatalogueScreenLoading) {
              const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is CatalogueScreenLoaded) {
              return ListView(children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 132,
                      decoration: const BoxDecoration(
                        gradient: AppGradient.purpleGradient,
                      ),
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigation.mainListNav.currentState
                                  ?.popAndPushNamed(
                                'home_screen/home_content_screen',
                              );
                            },
                            child:
                                SvgPicture.asset('assets/icons/arrow_left.svg'),
                          ),
                          Text(
                            LocaleKeys.catalogue.tr(),
                            // 'Catalogue',
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
                    Positioned(
                      top: 108,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        width: 375,
                        height: 44,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            prefixIcon: const Icon(Icons.search),
                            hintText: LocaleKeys.home_searchbar.tr(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.catalogue.length,
                    itemExtent: 120, //88,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            height: 176,
                            margin: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 8,
                              bottom: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                    ),
                                    child: Text(
                                      state.catalogue[index].title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.darkText,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Image.network(
                                  state.catalogue[index].imageUrl,
                                  fit: BoxFit.cover,
                                  height: 176,
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                showModalBottomSheet<Widget?>(
                                  useRootNavigator: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 33,
                                              ),
                                              child: Text(
                                                LocaleKeys.womens_fashion.tr(),
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.darkText,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          for (final category in categories)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 15,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigation
                                                      .mainListNav.currentState!
                                                      .pushNamed(
                                                    '/home_screen/catalogue_screen/clothing_screen',
                                                  );

                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  category,
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        AppColors.darkGreyText,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ]);
            }
            ;
            return Text('Error');
          },
        ),
      ),
    );
  }
}
