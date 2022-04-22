import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_screen.dart';
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

  // List<String> imgSlider = FireBaseStorageService().getListImg();

  var _icon = SvgPicture.asset('assets/icons/heart11.svg');
  var _iconStar = SvgPicture.asset(
    'assets/icons/star.svg',
  );
  int _sliderCurrent = 0;
  final CarouselController _sliderController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Stack(alignment: AlignmentDirectional.center, children: [
            SizedBox(
              width: 343,
              height: 88,
              child: // Column(children: [
                  CarouselSlider.builder(
                itemCount: imgSlider.length,
                carouselController: _sliderController,
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  // aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _sliderCurrent = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    width: 343,
                    height: 88,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(imgSlider[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgSlider.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _sliderController.animateToPage(entry.key),
                    child: Container(
                      width: 62,
                      height: 2,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        // shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.white70)
                            .withOpacity(
                          _sliderCurrent == entry.key ? 0.9 : 0.4,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 14, right: 177),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.fashion.tr(),
                    // 'Fashion Sale',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.see_all.tr(),
                        // 'See More',
                        style: const TextStyle(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
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
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 5,
            // itemExtent: 88,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: FutureBuilder<dynamic>(
                  future: FireBaseStorageService().getImg('img_gal.jpg'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(8)),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(snapshot.data
                                .toString()), //AssetImage(snapshot.data.toString()),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.phones.tr(), //'Phones',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }

                    return const CircularProgressIndicator();
                  },
                ),
              );
            },
          ),
        ),
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
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : GridView.builder(
                      itemCount: snapshot.data!.docs.length, //6,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 3
                            : 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 260,
                        childAspectRatio: 2 / 2,
                      ),
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data!.docs[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductPageScreen(),
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
                                          Radius.circular(8)),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          data['imageUrl'].toString(),
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
                                        gradient: AppGradient.orangeGradient,
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
                                      onPressed: () {
                                        setState(() {
                                          _icon = SvgPicture.asset(
                                            'assets/icons/favorite_heart.svg',
                                          );
                                        });
                                      },
                                      child: _icon,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      data['name'].toString(),
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
                                      r'$' + data['price'].toString(),
                                      style: TextStyle(
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
    );
  }
}
