import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/cart/check_out_screen/check_out_screen.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> listSize = [0, 1, 2];

    late num itemPrice;
    final totalList = <num>[];
    late num itemTotal;
    late num? totalSum;
    late dynamic _itemCounter;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('cart').snapshots(),
      builder: (context, snapshot) {
        totalSum = snapshot.data?.docs.fold<num>(
          0,
          (previousValue, element) {
            return previousValue +
                (element['price'] * element['quantity'] as num);
          },
        );

        return !snapshot.hasData
            ? const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: AppColors.backGround,
                body: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 88,
                      decoration: const BoxDecoration(
                        gradient: AppGradient.purpleGradient,
                      ),
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(
                              'assets/icons/arrow_left.svg',
                            ),
                          ),
                          Text(
                            LocaleKeys.cart.tr(),
                            // 'Cart',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              final snap = snapshot.data?.docs;
                              if (snap != null) {
                                for (final el in snap) {
                                  el.reference.delete();
                                }
                              }
                            },
                            child: Text(
                              LocaleKeys.delete.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 1,
                            thickness: 2,
                          );
                        },
                        clipBehavior: Clip.hardEdge,
                        itemCount: snapshot.data?.docs.length ?? 0,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot? data =
                              snapshot.data?.docs[index];

                          final String productId = data?.id ?? '';

                          _itemCounter = data?['quantity'] as int;
                          itemPrice = data?['price'] as num;

                          itemTotal = itemPrice * (_itemCounter as int);
                          print(itemTotal);

                          totalList.add(itemTotal);

                          print('LIST ${totalSum}');

                          return Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 16,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 117,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: index == listSize.last
                                  ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(24),
                                    )
                                  : null,
                              boxShadow: index ==
                                      snapshot.data?.docs.length //listSize.last
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(0, 6),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.network(
                                        data?['imageUrl'].toString() ??
                                            'Loading...',
                                        width: 80,
                                        height: 80,
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 60,
                                              ),
                                              child: Text(
                                                data?['name'].toString() ??
                                                    'Loading...',
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.darkText,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              '\$ ${data?['price']}',
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.darkText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print(_itemCounter);
                                        FirebaseFirestore.instance
                                            .collection('cart')
                                            .doc(productId)
                                            .update({
                                          'quantity': FieldValue.increment(1),
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/plus_icon.svg',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text('${_itemCounter}'),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (data?['quantity'] == 0) {
                                          return null;
                                        }
                                        FirebaseFirestore.instance
                                            .collection('cart')
                                            .doc(productId)
                                            .update({
                                          'quantity': FieldValue.increment(-1),
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/minus_icon.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 8),
                  width: MediaQuery.of(context).size.width,
                  height: 139,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              LocaleKeys.total_price.tr(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkText,
                              ),
                            ),
                          ),
                          Text(
                            '\$ $totalSum',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkText,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.yellow,
                          onPrimary: Colors.white,
                          minimumSize: const Size(373, 48),
                        ),
                        onPressed: () {
                          Navigation.mainAppNav.currentState?.pushNamed(
                            '/home_screen/cart_screen/check_out_screen',
                            arguments: totalSum ?? 0,
                          );
                        },
                        child: Text(
                          LocaleKeys.check_out.tr(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
