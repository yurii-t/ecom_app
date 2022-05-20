import 'package:ecom_app/data/models/product.dart';
import 'package:ecom_app/style/app_gradient.dart';

import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:ecom_app/ui/widgets/star_icon_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemContainer extends StatelessWidget {
  final Product product;
  final VoidCallback updateFavorite;
  const ItemContainer({
    required this.updateFavorite,
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.mainAppNav.currentState?.pushNamed(
          '/home_screen/product_screen',
          arguments: product.id,
        );
      },
      child: Stack(children: [
        Column(
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
                        product.imageUrl,
                      ),
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
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StarIconList(
                    productId: product.id,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.name,
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
                    r'$' + product.price.toString(),
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
        Positioned(
          top: 145,
          left: 110,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: const CircleBorder(),
            ),
            onPressed: updateFavorite,
            child: product.isFavorite
                ? SvgPicture.asset(
                    'assets/icons/favorite_heart.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/heart11.svg',
                  ),
          ),
        ),
      ]),
    );
  }
}
