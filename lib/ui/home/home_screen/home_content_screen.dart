import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_screen.dart';
import 'package:ecom_app/ui/home/home_screen/home_carousel_list.dart';
import 'package:ecom_app/ui/home/home_screen/home_catalogue_list.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({Key? key}) : super(key: key);

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  final List<String> imgSlider = [
    'assets/images/img_gal.jpg',
    'assets/images/img_content.png',
    'assets/images/catalogue_img.png',
    'assets/images/content_img1.png',
  ];
  bool favorite = false;

  // List<String> imgSlider = FireBaseStorageService().getListImg();

  var _icon = SvgPicture.asset('assets/icons/heart11.svg');
  var _iconStar = SvgPicture.asset(
    'assets/icons/star.svg',
  );
  int _sliderCurrent = 0;
  final CarouselController _sliderController = CarouselController();
  @override
  @override
  Widget build(BuildContext context) {
    return ListView(
      // shrinkWrap: true,
      children: [
        Column(
          children: [
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
                        SvgPicture.asset('assets/icons/menu_alt_2_1.svg'),
                        // const Icon(
                        //   Icons.menu,
                        //   color: Colors.white,
                        // ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
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
            const SizedBox(
              height: 34,
            ),
            HomeCarouselList(),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.catalogue.tr(),
                    // 'Catalogue',
                    style: const TextStyle(
                      fontSize: 19,
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CatalogueScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.see_all.tr(),
                          // 'See All',
                          style: const TextStyle(
                            color: AppColors.greyText,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.greyText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const HomeCatalogueList(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocaleKeys.popular.tr(), //'Featured',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 300,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const CircularProgressIndicator()
                      : GridView.builder(
                          itemCount: snapshot.data?.docs.length, //6,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? 3
                                    : 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 260,
                            childAspectRatio: 2 / 2,
                          ),
                          itemBuilder: (context, index) {
                            DocumentSnapshot? data = snapshot.data?.docs[index];
                            String productId = data?.id ?? '';

                            return GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductPageScreen(
                                      productId: productId,
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 163,
                                        height: 163,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              data?['imageUrl'].toString() ??
                                                  'Loading...',
                                            ),
                                            //   AssetImage(
                                            // 'assets/images/img_content.png',
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        child: Container(
                                          width: 47,
                                          height: 20,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight: Radius.circular(40),
                                            ),
                                            gradient:
                                                AppGradient.orangeGradient,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              '-50%',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 145,
                                        //right: 0,
                                        left: 110,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shape: const CircleBorder(),
                                            // padding: EdgeInsets.all(36),
                                          ),
                                          onPressed: () async {
                                            print('tap');
                                            setState(() {
                                              favorite = !favorite;
                                            });

                                            await data?.reference.update({
                                              'isFavorite': favorite,
                                            }).then(
                                              (value) => print('updated'),
                                            );
                                          },
                                          child: data?['isFavorite'] == true
                                              ? SvgPicture.asset(
                                                  'assets/icons/favorite_heart.svg',
                                                )
                                              : SvgPicture.asset(
                                                  'assets/icons/heart11.svg',
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            _iconStar,
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            _iconStar,
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            _iconStar,
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            _iconStar,
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            _iconStar,
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          data?['name'].toString() ?? 'Loading',
                                          //LocaleKeys.product_title.tr(),
                                          // 'ECOWISH Womens Color Block Striped Draped K kslkfajklsajlk',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          r'$' + '${data?['price']}',
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
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
        ),
      ],
    );
  }
}
