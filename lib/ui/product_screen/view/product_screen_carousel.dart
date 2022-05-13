import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreenCarousel extends StatefulWidget {
  final String productId;
  const ProductScreenCarousel({required this.productId, Key? key})
      : super(key: key);

  @override
  State<ProductScreenCarousel> createState() => _ProductPageCoruselState();
}

class _ProductPageCoruselState extends State<ProductScreenCarousel> {
  late List<dynamic> imgProductSlider;

  int _sliderProductCurrent = 0;
  final CarouselController _sliderProductController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('products')
          .doc(widget.productId)
          .get(),
      builder: (context, snapshot) {
        final DocumentSnapshot? data = snapshot.data;
        if (data != null) {
          imgProductSlider = data['img'] as List;
        }

        return !snapshot.hasData
            ? const CircularProgressIndicator()
            : Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  SizedBox(
                    height: 375,
                    child: CarouselSlider.builder(
                      itemCount: imgProductSlider.length,
                      carouselController: _sliderProductController,
                      options: CarouselOptions(
                        height: 375,
                        viewportFraction: 1,
                        autoPlay: false,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _sliderProductCurrent = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIdx) {
                        print('IMGGG${imgProductSlider}');

                        return Image(
                          image: NetworkImage(
                            imgProductSlider[index].toString(),
                          ),
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 340,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgProductSlider.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              _sliderProductController.animateToPage(entry.key),
                          child: Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
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
      },
    );
  }
}
