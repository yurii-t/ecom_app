import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsRelatedList extends StatefulWidget {
  const ProductsRelatedList({Key? key}) : super(key: key);

  @override
  State<ProductsRelatedList> createState() => _ProductsRelatedListState();
}

class _ProductsRelatedListState extends State<ProductsRelatedList> {
  var _icon = SvgPicture.asset(
    'assets/icons/heart11.svg',
  );
  var _iconStar = SvgPicture.asset(
    'assets/icons/star.svg',
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 267,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        shrinkWrap: true,
        itemExtent: 183,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const ProductPageScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      FutureBuilder<dynamic>(
                        future:
                            FireBaseStorageService().getImg('img_content.png'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Container(
                              width: 163,
                              height: 163,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(snapshot.data.toString()),
                                  // AssetImage(
                                  //   'assets/images/img_content.png',
                                  // ),
                                ),
                              ),
                            );
                          }

                          return const CircularProgressIndicator();
                        },
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
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        LocaleKeys.product_title.tr(),
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
                      const Text(
                        r'$101.33',
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
        },
      ),
    );
  }
}
