import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class ProductColorPicker extends StatefulWidget {
  final Function(String) onProductPicked;

  const ProductColorPicker({
    required this.onProductPicked,
    Key? key,
  }) : super(key: key);

  @override
  _MyProductColorPickerState createState() => _MyProductColorPickerState();
}

class _MyProductColorPickerState extends State<ProductColorPicker> {
  List<String> pick = [];
  final List<String> availableProductColor = [
    'assets/images/content_img1.png',
    'assets/images/imgcolor2.png',
    'assets/images/imgcolor3.png',
    'assets/images/imgcolor4.png',
    'assets/images/imgcolor1.png',
    'assets/images/imgcolor6.png',
  ];
  String colorsJoined = '';
  @override
  Widget build(BuildContext context) {
    const double _size = 50;

    return SizedBox(
      width: double.infinity,
      height: _size,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _size,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount:
            availableProductColor.length, //widget.availableProductColor.length,
        itemBuilder: (context, index) {
          final itemColor = availableProductColor[
              index]; //widget.availableProductColor[index];

          return InkWell(
            onTap: () {
              setState(() {
                if (pick.contains(itemColor)) {
                  pick.remove(itemColor);
                } else {
                  pick.add(itemColor);
                }
              });
              colorsJoined = pick.join(',');
              widget.onProductPicked(colorsJoined);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: pick.contains(itemColor)
                    ? Border.all(width: 2, color: AppColors.yellow)
                    : Border.all(width: 0, color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(availableProductColor[
                      index]), //widget.availableProductColor[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
