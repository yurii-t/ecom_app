import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/cart/cart_screen/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

List<int> listSize = [0, 1, 2];

class _CartScreenState extends State<CartScreen> {
  late num itemPrice;
  final totalList = <num>[];
  late num itemTotal;
  late num? totalSum;
  late dynamic _itemCounter;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('cart').snapshots(),
      builder: (context, snapshot) {
        totalSum = snapshot.data?.docs.fold<num>(
          0,
          (previousValue, element) {
            //previousValue = (snapshot!.data['quantity']  * snapshot.data['price']) as num;
            // print('PPP ${element['price']}');

            return previousValue +
                (element['price'] * element['quantity'] as num);
          },
        );

        return !snapshot.hasData
            ? const CircularProgressIndicator()
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
                      child: Padding(
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
                            // const Icon(
                            //   Icons.menu,
                            //   color: Colors.white,
                            // ),
                            //
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
                                var col = FirebaseFirestore.instance
                                    .collection('cart')
                                    .snapshots();

                                var snap = snapshot.data?.docs;
                                if (snap != null) {
                                  for (var el in snap) {
                                    el.reference.delete();
                                  }
                                }

                                // DocumentSnapshot snap = snapshot.data.docs;
                              },
                              child: Text(
                                LocaleKeys.delete.tr(),
                                // 'Delete',
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
                    ),
                    // StreamBuilder<QuerySnapshot>(
                    //   stream: FirebaseFirestore.instance.collection('cart').snapshots(),
                    //   builder: (context, snapshot) {
                    //     totalSum = snapshot.data!.docs.fold<num>(
                    //       0,
                    //       (previousValue, element) {
                    //         //previousValue = (snapshot!.data['quantity']  * snapshot.data['price']) as num;
                    //         // print('PPP ${element['price']}');

                    //         return previousValue +
                    //             (element['price'] * element['quantity'] as num);
                    //       },
                    //     );

                    //     return !snapshot.hasData
                    //         ? const CircularProgressIndicator()
                    //         :
                    //
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 1,
                            thickness: 2,
                            // color: Colors.red,
                          );
                        },
                        clipBehavior: Clip.hardEdge,
                        itemCount: snapshot.data?.docs.length ??
                            0, //listSize.length, //3,
                        itemBuilder: (context, index) {
                          DocumentSnapshot? data = snapshot.data?.docs[index];

                          String productId = data?.id ?? '';

                          int lenght = snapshot.data?.size ?? 0;
                          _itemCounter = data?['quantity'] as int;
                          itemPrice = data?['price'] as num;

                          itemTotal = itemPrice * (_itemCounter as int);
                          print(itemTotal);
                          // var sum = snapshot.data!.docs.fold<num>(
                          //   0,
                          //   (previousValue, element) {
                          //     previousValue = data['quantity'] * data['price']as num;
                          //     print('PPP ${element['price']}');
                          //     return previousValue + (element['price'] * element['quantity'] as num);
                          //   },
                          // );

                          totalList.add(itemTotal);

                          print('LIST ${totalSum}');
                          // totalSum = totalList.take(lenght);

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
                                      snapshot.data?.docs.last //listSize.last
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
                                      // Image.asset(
                                      //   'assets/images/content_img1.png',
                                      //   width: 80,
                                      //   height: 80,
                                      // ),
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
                                                // LocaleKeys.product_title.tr(),
                                                // 'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
                                                textAlign: TextAlign.start,
                                                //overflow: TextOverflow.ellipsis,
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
                                        // print('plust');
                                        // print(productId);
                                        // setState(() {
                                        //   _itemCounter + 1;
                                        // });
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
                                        // print('minus');
                                        // setState(() {
                                        //   _itemCounter - 1;
                                        // });
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
                    //   },
                    // ),
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
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              LocaleKeys.total_price.tr(),
                              // 'Total price',
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
                          // print('LIST $itemTotal');
                          // CollectionReference collectionRef =
                          //       FirebaseFirestore.instance.collection('checkout');
                          //   collectionRef.doc().set({
                          //     'name': dataName,
                          //     'price': dataPrice,
                          //     'imageUrl': dataimgUrl,
                          //     'quantity': widget.item,
                          //   });

                          Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutScreen(
                                itemsPrice: totalSum ?? 0,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          LocaleKeys.check_out.tr(),
                          // 'Check Out',
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
