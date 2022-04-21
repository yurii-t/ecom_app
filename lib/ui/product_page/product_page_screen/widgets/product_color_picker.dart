import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class ProductColorPicker extends StatefulWidget {
  //final Function onSelectSize;

  final List<String> availableProductColor;

  const ProductColorPicker({
    required this.availableProductColor,
    Key? key,
    // required this.onSelectSize,
  }) : super(key: key);

  @override
  _MyProductColorPickerState createState() => _MyProductColorPickerState();
}

class _MyProductColorPickerState extends State<ProductColorPicker> {
  List<String> pick = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 50,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.availableProductColor.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableProductColor[index];

          return InkWell(
            onTap: () {
              setState(() {
                if (pick.contains(itemColor)) {
                  pick.remove(itemColor);
                } else {
                  pick.add(itemColor);
                }
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                // color: pick.contains(itemColor)
                //     ? AppColors.yellowColor
                //     : Colors.white,
                //itemColor == _pickedColor ? AppColors.yellowColor: Colors.white,

                border: pick.contains(itemColor)
                    ? Border.all(width: 2, color: AppColors.yellow)
                    : Border.all(width: 0, color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(widget.availableProductColor[index]),
                ),
              ),
              // child: Center(
              //   child: Text(
              //     itemColor,
              //     style: pick.contains(itemColor)
              //         ? const TextStyle(color: Colors.white)
              //         : const TextStyle(color: AppColors.darkTextColor),
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }
}
