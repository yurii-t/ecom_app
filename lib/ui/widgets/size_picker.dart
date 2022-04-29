// my_color_picker.dart
import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  Function(String) onSizePicked;

  SizePicker({
    required this.onSizePicked,
    //required this.availableSizes,
    Key? key,
  }) : super(key: key);

  @override
  _SizePickerState createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  List<String> pick = [];
  final List<String> availableSizes = [
    'xss',
    'xs',
    's',
    'm',
    'l',
    'xl',
  ];
  String sizesJioned = '';

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
        itemCount: availableSizes.length,
        itemBuilder: (context, index) {
          final itemColor = availableSizes[index];

          return InkWell(
            onTap: () {
              setState(() {
                if (pick.contains(itemColor)) {
                  pick.remove(itemColor);
                } else {
                  pick.add(itemColor);
                }
              });
              sizesJioned = pick.join(',');
              widget.onSizePicked(sizesJioned);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color:
                    pick.contains(itemColor) ? AppColors.yellow : Colors.white,
                //itemColor == _pickedColor ? AppColors.yellowColor: Colors.white,

                border: Border.all(color: AppColors.grayLight),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  itemColor,
                  style: pick.contains(itemColor)
                      ? const TextStyle(color: Colors.white)
                      : const TextStyle(color: AppColors.darkText),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
