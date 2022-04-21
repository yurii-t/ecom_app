import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductPageCarousel extends StatefulWidget {
  const ProductPageCarousel({Key? key}) : super(key: key);

  @override
  State<ProductPageCarousel> createState() => _ProductPageCoruselState();
}

class _ProductPageCoruselState extends State<ProductPageCarousel> {
  final List<String> imgSlider = [
    'assets/images/img_gal.jpg',
    'assets/images/product_img1.png',
    'assets/images/product_img12.jpg',
    'assets/images/content_img1.png',
  ];

  int _sliderProductCurrent = 0;
  final CarouselController _sliderProductController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        SizedBox(
          //  width: 343,
          height: 375,

          child: // Column(children: [
              CarouselSlider.builder(
            itemCount: imgSlider.length,
            carouselController: _sliderProductController,
            options: CarouselOptions(
              height: 375,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: false,
              // aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _sliderProductCurrent = index;
                });
              },
            ),
            itemBuilder: (context, index, realIdx) {
              return Container(
                // width: 343,
                //  height: 375,

                decoration: BoxDecoration(
                  // borderRadius: const BorderRadius.all(Radius.circular(8)),

                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(imgSlider[index]),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 340,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgSlider.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _sliderProductController.animateToPage(entry.key),
                child: Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.white70)
                        .withOpacity(
                      _sliderProductCurrent == entry.key ? 1 : 0.4,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
