import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

class DeliveryPicker extends StatefulWidget {
  final Function(int) onDeliveryPickedPrice;

  const DeliveryPicker({
    required this.onDeliveryPickedPrice,
    Key? key,
  }) : super(key: key);

  @override
  _DeliveryPickerState createState() => _DeliveryPickerState();
}

class _DeliveryPickerState extends State<DeliveryPicker> {
  final List<int> delPrice = [15, 18, 20];

  final List<Widget> availableDelivery = [
    Center(
      child: Column(
        children: [
          FutureBuilder<dynamic>(
            future: FireBaseStorageService().getImg('del1.png'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Image.network(
                  snapshot.data.toString(),
                  width: 71,
                  height: 16,
                );
              }

              return const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            r'$15',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
          ),
          Text(
            '1-2 ${LocaleKeys.days.tr()}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          FutureBuilder<dynamic>(
            future: FireBaseStorageService().getImg('del2.png'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Image.network(
                  snapshot.data.toString(),
                  width: 71,
                  height: 16,
                );
              }

              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            r'$18',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
          ),
          Text(
            '1-2 ${LocaleKeys.days.tr()}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/del3.png',
            width: 71,
            height: 16,
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            r'$20',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
          ),
          Text(
            '1-2 ${LocaleKeys.days.tr()}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    ),
  ];
  Widget? _pickedDelivery;

  @override
  Widget build(BuildContext context) {
    const double _size = 110;

    return SizedBox(
      width: double.infinity,
      height: _size,
      child: GridView.builder(
        clipBehavior: Clip.none,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _size,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: availableDelivery.length,
        itemBuilder: (context, index) {
          final item = availableDelivery[index];

          return GestureDetector(
            onTap: () {
              widget.onDeliveryPickedPrice(delPrice[index]);
              setState(() {
                _pickedDelivery = item;
                print(_pickedDelivery);
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
