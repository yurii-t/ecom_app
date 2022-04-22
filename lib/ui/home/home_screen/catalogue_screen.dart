import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/home_screen/clothing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: IndexedStack(index: _pageIndex, children: [
          Column(children: [
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child:
                              SvgPicture.asset('assets/icons/arrow_left.svg'),
                        ),
                        // const Icon(
                        //   Icons.menu,
                        //   color: Colors.white,
                        // ),
                        Text(
                          LocaleKeys.catalogue.tr(),
                          // 'Catalogue',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: Colors.white,
                          ),
                        ),
                        // const Icon(Icons.notifications_outlined,
                        //     color: Colors.white),
                        SvgPicture.asset('assets/icons/bell_1.svg'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 108,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
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
                          hintText: LocaleKeys.home_searchbar
                              .tr(), //'What are you looking for',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: SizedBox(
                //  width: MediaQuery.of(context).size.width,
                //  height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // padding: EdgeInsets.only(top:70),
                  // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 8,
                  itemExtent: 120, //88,
                  itemBuilder: (context, index) {
                    return // Padding(padding: EdgeInsets.symmetric(horizontal:16, vertical:10),
                        // child:
                        Stack(
                      //  fit: StackFit.passthrough,
                      children: [
                        Container(
                          height: 176,
                          margin: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8,
                            bottom: 8,
                          ),
                          //padding: EdgeInsets.only(left: ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black.withOpacity(0.2),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
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
                                    LocaleKeys.womens_fashion.tr(),
                                    // 'Women`s Fashion',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.darkText,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              FutureBuilder<dynamic>(
                                future: FireBaseStorageService()
                                    .getImg('img_gal.jpg'),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Image.network(
                                      snapshot.data.toString(),
                                    );
                                  }

                                  return const CircularProgressIndicator();
                                },
                              ),
                              // Image.asset(
                              //   'assets/images/img_gal.jpg',
                              //   width: 88,
                              //   fit: BoxFit.fitHeight,
                              // ),
                            ],
                          ),
                        ),
                        // CategoriesWidget()
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              showBottomSheet<Widget?>(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 33,
                                            ),
                                            child: Text(
                                              LocaleKeys.womens_fashion.tr(),
                                              // 'Women`s Fashion',
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
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _pageIndex = 1;
                                            });
                                          },
                                          child: Text(
                                            LocaleKeys.clothing.tr(),
                                            // 'Clothing',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //    SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _pageIndex = 0;
                                            });
                                          },
                                          child: Text(
                                            LocaleKeys.shoes.tr(),
                                            // 'Shoes',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.jewelry.tr(),
                                            // 'Jewelry',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.watches.tr(),
                                            // 'Watches',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.handbags.tr(),
                                            // 'Handbags',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.accessories.tr(),
                                            // 'Accessories',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.mens_fashion.tr(),
                                            // 'Man`s Fashion',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.girls_fashion.tr(),
                                            // 'Girl`s Fashion',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
                                            ),
                                          ),
                                        ),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.boys_fashion.tr(),
                                            // 'Boy`s Fashion',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkGreyText,
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

                    //   );
                  },
                ),
              ),
            ),
          ]),
          ClothingScreen(onBackButtonPressed: () {
            setState(() {
              _pageIndex = 0;
            });
          }),
        ]),
      ),
    );
  }
}
