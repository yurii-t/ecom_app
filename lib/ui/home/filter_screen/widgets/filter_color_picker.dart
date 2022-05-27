import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class FilterColorPicker extends StatelessWidget {
  final Function(Color) onColorPicked;
  final List<Color> availableColors;

  final bool circleItem;

  final ValueNotifier<Color> colorNotifier;
  const FilterColorPicker({
    required this.colorNotifier,
    required this.onColorPicked,
    required this.availableColors,
    Key? key,
    this.circleItem = true,
  }) : super(key: key);

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
        itemCount: availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = availableColors[index];

          return InkWell(
            onTap: () {
              colorNotifier.value = itemColor;
              onColorPicked(itemColor);
            },
            child: ValueListenableBuilder(
              valueListenable: colorNotifier,
              builder: (context, notifierItemColor, child) {
                return Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: itemColor == notifierItemColor
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
                        shape:
                            circleItem ? BoxShape.circle : BoxShape.rectangle,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
