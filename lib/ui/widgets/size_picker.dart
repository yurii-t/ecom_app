import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  final Function(List<String>) onSizePicked;
  List<String> initPick;
  SizePicker({
    required this.initPick,
    required this.onSizePicked,
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
        itemCount: availableSizes.length,
        itemBuilder: (context, index) {
          final itemColor = availableSizes[index];

          return InkWell(
            onTap: () {
              setState(() {
                if (widget.initPick.contains(itemColor)) {
                  widget.initPick.remove(itemColor);
                } else {
                  widget.initPick.add(itemColor);
                }
              });
              sizesJioned = widget.initPick.join(',');
              widget.onSizePicked(widget.initPick);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: widget.initPick.contains(itemColor)
                    ? AppColors.yellow
                    : Colors.white,
                border: Border.all(color: AppColors.grayLight),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  itemColor,
                  style: widget.initPick.contains(itemColor)
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
