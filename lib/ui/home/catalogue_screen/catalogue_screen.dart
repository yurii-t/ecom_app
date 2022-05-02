import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/clothing_screen/clothing_screen.dart';
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
                        Text(
                          LocaleKeys.catalogue.tr(),
                          // 'Catalogue',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: Colors.white,
                          ),
                        ),
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Catalogue')
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const CircularProgressIndicator()
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            // padding: EdgeInsets.only(top:70),
                            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            itemCount: snapshot.data?.docs.length,
                            itemExtent: 120, //88,
                            itemBuilder: (context, index) {
                              DocumentSnapshot? data =
                                  snapshot.data?.docs[index];

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
                                              data?['title'].toString() ??
                                                  'Loading...',
                                              // LocaleKeys.womens_fashion.tr(),
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
                                        Image.network(
                                          data?['imageUrl'].toString() ??
                                              'Loading...',
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
                                        showBottomSheet<Widget?>(
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
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment
                                                //         .spaceEvenly,
                                                children: [
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 33,
                                                      ),
                                                      child: Text(
                                                        LocaleKeys
                                                            .womens_fashion
                                                            .tr(),
                                                        // 'Women`s Fashion',
                                                        style: const TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppColors
                                                              .darkText,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  for (final category
                                                      in categories)
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _pageIndex = 1;
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        category,
                                                        // LocaleKeys.clothing.tr(),
                                                        // 'Clothing',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .darkGreyText,
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
                          );
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
