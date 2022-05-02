import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarIconList extends StatelessWidget {
  const StarIconList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconStar = SvgPicture.asset(
      'assets/icons/star.svg',
    );

    return Row(
      children: [
        iconStar,
        const SizedBox(
          width: 3,
        ),
        iconStar,
        const SizedBox(
          width: 3,
        ),
        iconStar,
        const SizedBox(
          width: 3,
        ),
        iconStar,
        const SizedBox(
          width: 3,
        ),
        iconStar,
      ],
    );
  }
}
