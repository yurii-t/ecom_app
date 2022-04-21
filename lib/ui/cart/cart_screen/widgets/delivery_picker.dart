// my_color_picker.dart
import 'package:ecom_app/style/app_colors.dart';
import 'package:flutter/material.dart';

class DeliveryPicker extends StatefulWidget {
  final List<Widget> availableDelivery;

  const DeliveryPicker({
    required this.availableDelivery,
    Key? key,
  }) : super(key: key);

  @override
  _DeliveryPickerState createState() => _DeliveryPickerState();
}

class _DeliveryPickerState extends State<DeliveryPicker> {
  Widget? _pickedDelivery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 110,
      child: GridView.builder(
        clipBehavior: Clip.none,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 110,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: widget.availableDelivery.length,
        itemBuilder: (context, index) {
          final item = widget.availableDelivery[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                _pickedDelivery = item;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              width: 92,
              height: 103,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: item == _pickedDelivery
                    ? Border.all(width: 2, color: AppColors.yellow)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: item,
            ),
          );
        },
      ),
    );
  }
}
