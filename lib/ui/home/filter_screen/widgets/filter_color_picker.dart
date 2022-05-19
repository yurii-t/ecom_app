import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class FilterColorPicker extends StatefulWidget {
  final List<Color> availableColors;

  final bool circleItem;
  Color initColor;
  FilterColorPicker({
    required this.initColor,
    required this.availableColors,
    Key? key,
    this.circleItem = true,
  }) : super(key: key);

  @override
  _FilterColorPickerState createState() => _FilterColorPickerState();
}

class _FilterColorPickerState extends State<FilterColorPicker> {
  Color _pickedColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    const double _size = 50;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _size,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];

          return InkWell(
            onTap: () {
              setState(() {
                // _pickedColor = itemColor;
                widget.initColor = itemColor;
              });
            },
            child: Container(
              width: 47,
              height: 47,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: //itemColor == _pickedColor
                    itemColor == widget.initColor
                        ? Border.all(width: 2, color: AppColors.yellow)
                        : Border.all(width: 0, color: Colors.transparent),
                shape: BoxShape.circle,
              ),
              child: FractionallySizedBox(
                heightFactor: 0.9,
                widthFactor: 0.9,
                child: Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: itemColor,
                    shape: widget.circleItem
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
