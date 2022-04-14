// my_color_picker.dart
import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MySizePicker extends StatefulWidget {
  //final Function onSelectSize;

  final List<String> availableSizes;

  const MySizePicker({
    Key? key,
    // required this.onSelectSize,
    required this.availableSizes,
  }) : super(key: key);

  @override
  _MySizePickerState createState() => _MySizePickerState();
}

class _MySizePickerState extends State<MySizePicker> {
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
            mainAxisSpacing: 10),
        itemCount: widget.availableSizes.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableSizes[index];
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
                color: pick.contains(itemColor)
                    ? AppColors.yellowColor
                    : Colors.white,
                //itemColor == _pickedColor ? AppColors.yellowColor: Colors.white,

                border: Border.all(color: AppColors.grayLightColor),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  itemColor,
                  style: pick.contains(itemColor)
                      ? const TextStyle(color: Colors.white)
                      : const TextStyle(color: AppColors.darkTextColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class MyProductColorPicker extends StatefulWidget {
  //final Function onSelectSize;

  final List<String> availableProductColor;

  const MyProductColorPicker({
    Key? key,
    // required this.onSelectSize,
    required this.availableProductColor,
  }) : super(key: key);

  @override
  _MyProductColorPickerState createState() => _MyProductColorPickerState();
}

class _MyProductColorPickerState extends State<MyProductColorPicker> {
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
            mainAxisSpacing: 10),
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
                    ? Border.all(width: 2, color: AppColors.yellowColor)
                    : Border.all(width: 0, color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                           fit: BoxFit.fill,
                           image: AssetImage(widget.availableProductColor[index]),
                         )
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