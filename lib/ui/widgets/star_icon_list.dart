import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarIconList extends StatelessWidget {
  final int value;
  const StarIconList({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconStar = SvgPicture.asset(
      'assets/icons/star.svg',
    );
    //  List icons = <SvgPicture>[iconStar,iconStar,iconStar,iconStar,iconStar,];

    return Row(
      children: List.generate(5, (index) {
        return index < value
            ? SvgPicture.asset(
                'assets/icons/star.svg',
              )
            : SvgPicture.asset(
                'assets/icons/star.svg',
                color: Colors.grey,
              );
      }),
    );

    // Row(
    //   children: [

    // iconStar,
    // const SizedBox(
    //   width: 3,
    // ),
    // iconStar,
    // const SizedBox(
    //   width: 3,
    // ),
    // iconStar,
    // const SizedBox(
    //   width: 3,
    // ),
    // iconStar,
    // const SizedBox(
    //   width: 3,
    // ),
    // iconStar,
    //   ],
    // );
  }
}
