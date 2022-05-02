import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductPageCarousel extends StatefulWidget {
  final String productId;
  ProductPageCarousel({required this.productId, Key? key}) : super(key: key);

  @override
  State<ProductPageCarousel> createState() => _ProductPageCoruselState();
}

class _ProductPageCoruselState extends State<ProductPageCarousel> {
  late List<dynamic> imgProductSlider;
  // 'assets/images/img_gal.jpg',
  // 'assets/images/product_img1.png',
  // 'assets/images/product_img12.jpg',
  // 'assets/images/content_img1.png',
  // ];

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
        DocumentSnapshot? data = snapshot.data;
        if (data != null) {
          imgProductSlider = data['img'] as List;
        }

        return !snapshot.hasData
            ? const CircularProgressIndicator()
            : Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  SizedBox(
                    //  width: 343,
                    height: 375,

                    child: // Column(children: [
                        CarouselSlider.builder(
                      itemCount: imgProductSlider.length,
                      carouselController: _sliderProductController,
                      options: CarouselOptions(
                        height: 375,
                        viewportFraction: 1,
                        autoPlay: false,
                        enlargeCenterPage: false,
                        // aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // imgProductSlider.add(data['img'].toString());
                            _sliderProductCurrent = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIdx) {
                        // DocumentSnapshot data = snapshot.data!; //.get('img');

                        // imgSlider.add(data['img'].toString());
                        // print(imgSlider);

                        // for (var item in data['img']) {
                        //   // print('IMGGG$item');
                        //   imgProductSlider.add(data['img'].toString());
                        // }

                        // imgProductSlider.add((data['img'].toString()));
                        print('IMGGG${imgProductSlider}');

                        return Container(
                          // width: 343,
                          //  height: 375,

                          // decoration: BoxDecoration(
                          //   // borderRadius: const BorderRadius.all(Radius.circular(8)),

                          //   image: DecorationImage(
                          //     fit: BoxFit.fill,
                          //     image: NetworkImage(imgProductSlider[index]),
                          //   ),
                          // ),
                          child: Image(
                            image: NetworkImage(
                              imgProductSlider[index].toString(),
                            ),
                            fit: BoxFit.fill,
                          ),
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
                              //borderRadius: const BorderRadius.all(Radius.circular(8)),
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
