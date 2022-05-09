import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

class HomeCarouselList extends StatefulWidget {
  const HomeCarouselList({Key? key}) : super(key: key);

  @override
  State<HomeCarouselList> createState() => _HomeCarouselListState();
}

class _HomeCarouselListState extends State<HomeCarouselList> {
  List<dynamic> imgSlider = <String>[];
  //   'assets/images/img_gal.jpg',
  //   'assets/images/img_content.png',>
  //   'assets/images/catalogue_img.png',
  //   'assets/images/content_img1.png',
  // ];
  int _sliderCurrent = 0;
  final CarouselController _sliderController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          width: 343,
          height: 88,
          child: // Column(children: [
              FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('carousel')
                .doc('LMQaDghBVCoM807xIcTS')
                .get(),
            builder: (context, snapshot) {
              final DocumentSnapshot? data = snapshot.data;

              if (data != null) {
                imgSlider = data['imgs'] as List;
              }

              return !snapshot.hasData
                  ? const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : CarouselSlider.builder(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imgSlider[index].toString()),
                            ),
                          ),
                        );
                      },
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
      ],
      //),
    );
  }
}
