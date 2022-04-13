// my_color_picker.dart
import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class MyColorPicker extends StatefulWidget {
  // List of pickable colors
  final List<Color> availableColors;

  // The default picked color
  final Color initialColor;

  // Determnie shapes of color cells
  final bool circleItem;

  const MyColorPicker(
      {Key? key,
      required this.availableColors,
      required this.initialColor,
      this.circleItem = true})
      : super(key: key);

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // This variable used to determine where the checkmark will be
  late Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 50,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          return InkWell(
            onTap: () {
              setState(() {
                _pickedColor = itemColor;
              });
            },
            child: Container(
              width: 47,
              height: 47,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: itemColor == _pickedColor
                    ? Border.all(width: 2, color: AppColors.yellowColor)
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
                      shape: widget.circleItem == true
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      border:
                          Border.all(width: 1, color: Colors.grey.shade300)),
                  // child: itemColor == _pickedColor
                  //     ? const Center(
                  //         child: Icon(
                  //           Icons.check,
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     : Container(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
