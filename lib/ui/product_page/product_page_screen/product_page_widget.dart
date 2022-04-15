import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app/core/util/size_picker.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/cart/cart_screen/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProdutPageWidget extends StatefulWidget {
  const ProdutPageWidget({Key? key}) : super(key: key);

  @override
  State<ProdutPageWidget> createState() => _ProdutPageWidgetState();
}

class _ProdutPageWidgetState extends State<ProdutPageWidget> {
  int _itemCounter = 0;
  var _icon = SvgPicture.asset('icons/heart11.svg',);
  int _sliderProductCurrent = 0;
  final CarouselController _sliderProductController = CarouselController();
  final List<String> imgSlider = [
    'images/img_gal.jpg',
    'images/product_img1.png',
    'images/product_img12.jpg',
    'images/content_img1.png'
  ];

  bool _isOpen = false;
  static double _minHeight = 175;
  final double _maxHeight = 600;

  void openReview() {
    if (!_isOpen) {
      setState(() {
        _minHeight = _maxHeight;
      });
    } else {
      setState(() {
        _minHeight = 175;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 708,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(alignment: AlignmentDirectional.topCenter, children: [
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
                              }),
                          itemBuilder: (context, index, realIdx) {
                            return Container(
                              // width: 343,
                              //  height: 375,

                              decoration: BoxDecoration(
                                  // borderRadius: const BorderRadius.all(Radius.circular(8)),

                                  image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(imgSlider[index]),
                              )),
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
                              onTap: () => _sliderProductController
                                  .animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.white)
                                        .withOpacity(
                                            _sliderProductCurrent == entry.key
                                                ? 1
                                                : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: AppColors.starIconColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: AppColors.starIconColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: AppColors.starIconColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: AppColors.starIconColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: AppColors.starIconColor,
                                    ),
                                    Text(
                                      '8 reviews',
                                      style: TextStyle(
                                          color: AppColors.darkGreyTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                'In Stock',
                                style: TextStyle(
                                    color: AppColors.greenTextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const Text(
                            'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
                            style: TextStyle(
                                color: AppColors.darkTextColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            '\$89.99',
                            style: TextStyle(
                                color: AppColors.darkTextColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Colors',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.greyTextColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const MyProductColorPicker(
                            availableProductColor: [
                              'images/content_img1.png',
                              'images/imgcolor2.png',
                              'images/imgcolor3.png',
                              'images/imgcolor4.png',
                              'images/imgcolor1.png',
                              'images/imgcolor6.png',
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Sizes',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.greyTextColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const MySizePicker(
                            availableSizes: [
                              'xss',
                              'xs',
                              's',
                              'm',
                              'l',
                              'xl',
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: _minHeight, //175,
                    padding: const EdgeInsets.only(
                        top: 24, left: 16, right: 16, bottom: 12),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Product details',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                              color: AppColors.darkTextColor,
                            ),
                          ),
                          Text(
                            'Women`s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li bfmfamnbnmsfbfmsmnfs kadlk klfkk n NMF Women`s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li bfmfamnbnmsfbfmsmnfs kadlk klfkk n NMF',
                            overflow:
                                _isOpen == false ? TextOverflow.ellipsis : null,
                            maxLines: _isOpen == false ? 4 : null,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.darkTextColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: IconButton(
                                onPressed: () {
                                  openReview();
                                  setState(() {
                                    _isOpen = !_isOpen;
                                  });
                                },
                                icon: const Icon(Icons.keyboard_arrow_down)),
                          )
                        ])),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 273,
                  padding: const EdgeInsets.only(
                      top: 24, left: 16, right: 16, bottom: 16),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Reviews',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: AppColors.darkTextColor,
                                ),
                              ),
                            ),
                            Row(
                              children: const [
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    color: AppColors.greyTextColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: AppColors.greyTextColor,
                                )
                              ],
                            ),
                          ],
                        ),
                        const Text(
                          'Olha Chabanova',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.darkTextColor,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: AppColors.starIconColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: AppColors.starIconColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: AppColors.starIconColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: AppColors.starIconColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: AppColors.starIconColor,
                                  ),
                                  Text(
                                    '8 reviews',
                                    style: TextStyle(
                                        color: AppColors.darkGreyTextColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            const Text(
                              'June 5,2021',
                              style: TextStyle(
                                  color: AppColors.darkGreyTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const Text(
                          'I`m old (rolling through my 50`s). But, this is my daughter in law`s favorite color right now.❤️ So I wear it whenever we hang out! She`s my fashion consultant who keeps me on trend🤣',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.darkTextColor,
                          ),
                        ),
                        const Text(
                          '835 people found this helpful',
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Comment',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.darkTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Helpful ',
                                  style: TextStyle(
                                    color: AppColors.greyTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                SvgPicture.asset('icons/like_button_icon.svg'),
                              ],
                            ),
                          ],
                        ),
                      ])),
              const SizedBox(
                height: 34,
              ),
              const Text(
                'Products related to this item',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color: AppColors.darkTextColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: 267,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    shrinkWrap: true,
                    itemExtent: 183,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProdutPageWidget()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 163,
                                    height: 163,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'images/img_content.png'),
                                        )),
                                  ),
                                  Positioned(
                                    top: 8,
                                    child: Container(
                                      width: 47,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40)),
                                        gradient: AppColors.orangeGradient,
                                      ),
                                      child: const Center(
                                          child: Text(
                                        '-50%',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700),
                                      )),
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
                                              'icons/favorite_heart.svg');
                                        });
                                      },
                                      child: _icon,
                                      //SvgPicture.asset('icons/heart11.svg',color: Colors.purple),

                                      // ShaderMask(
                                      //     shaderCallback: (Rect bounds) {
                                      //       return AppColors.purpleGradient.createShader(bounds);
                                      //       // const LinearGradient(
                                      //       //   colors: [
                                      //       //      Color.fromRGBO(52, 40, 60, 1),
                                      //       //      Color.fromRGBO(132, 95, 161, 1),
                                      //       //   ],
                                      //       //   begin: Alignment.centerLeft,
                                      //       //   end: Alignment.centerRight,
                                      //       // ).createShader(bounds);
                                      //     },
                                      //       child:SvgPicture.asset('icons/heart.svg',),
                                      //     //const Icon(
                                      //     //   Icons.favorite_outline,
                                      //     //   size: 15,
                                      //   //  )
                                      //     )
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'ECOWISH Womens Color Block Striped Draped K kslkfajklsajlk',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    '\$102.33',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(left: 26, right: 26, top: 8),
          width: MediaQuery.of(context).size.width,
          height: 87,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    //back to clothing page
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset('icons/arrow_left_bottom.svg')),
              Builder(builder: (context) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.yellowColor,
                      onPrimary: Colors.white,
                      minimumSize: const Size(215, 48),
                    ),
                    onPressed: () {
                      setState(() {
                        _itemCounter = 1;
                      });
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          )),
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 33, bottom: 34),
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'images/content_img1.png',
                                                width: 80,
                                                height: 80,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 60),
                                                      child: Text(
                                                        'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
                                                        textAlign:
                                                            TextAlign.start,
                                                        //overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .darkTextColor),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      '89.99',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppColors
                                                              .darkTextColor),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _itemCounter++;
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                    'icons/plus_icon.svg')),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text('$_itemCounter'),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _itemCounter--;
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                    'icons/minus_icon.svg')),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Text(
                                      'Colors',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: AppColors.greyTextColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const MyProductColorPicker(
                                      availableProductColor: [
                                        'images/content_img1.png',
                                        'images/imgcolor2.png',
                                        'images/imgcolor3.png',
                                        'images/imgcolor4.png',
                                        'images/imgcolor1.png',
                                        'images/imgcolor6.png',
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Text(
                                      'Sizes',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: AppColors.greyTextColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const MySizePicker(
                                      availableSizes: [
                                        'xss',
                                        'xs',
                                        's',
                                        'm',
                                        'l',
                                        'xl',
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                //back to clothing page
                                                Navigator.of(context).pop();
                                              },
                                              child: SvgPicture.asset(
                                                  'icons/arrow_left_bottom.svg')),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: AppColors.yellowColor,
                                              onPrimary: Colors.white,
                                              minimumSize: const Size(215, 48),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _itemCounter++;
                                              });
                                            },
                                            child: const Text(
                                              'Add to cart',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                //back to clothing page
                                                Navigator.of(context).pop();
                                              },
                                              child: _icon),
                                        ])
                                  ],
                                ),
                              );
                            });
                          });
                    },
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ));
                //  )
              }),
              GestureDetector(
                  onTap: () {
                    //add to favorite
                    Navigator.of(context).pop();
                  },
                  child: _icon),
            ],
          ),
        ),
      ),
    );
  }
}
