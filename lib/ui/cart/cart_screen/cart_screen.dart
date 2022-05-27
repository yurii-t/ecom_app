import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecom_app/routes/app_router.gr.dart';

import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> listSize = [0, 1, 2];
    num calculatedTotalSum = 0;

    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoading) {
        return const Center(
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
        );
      }
      if (state is CartLoaded) {
        return Scaffold(
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
                        context.router.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/arrow_left.svg',
                      ),
                    ),
                    Text(
                      LocaleKeys.cart.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              RemoveProducts(
                                state.cartItems,
                              ),
                            );
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
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
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
                        boxShadow: index == state.cartItems.last
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
                                  state.cartItems[index].imageUrl,
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
                                          state.cartItems[index].name,
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
                                        '\$ ${state.cartItems[index].price}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<CartBloc>().add(IncreaseQuantity(
                                        state.cartItems[index].id,
                                      ));
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/plus_icon.svg',
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                state.cartItems[index].quantity.toString(),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (state.cartItems[index].quantity == 0) {
                                    return null;
                                  } else {
                                    context.read<CartBloc>().add(
                                          DecreaseQuantity(
                                            state.cartItems[index].id,
                                          ),
                                        );
                                  }
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
                    BlocSelector<CartBloc, CartState, num>(
                      selector: (state) => state is CartLoaded
                          ? state.cartItems.fold(
                              0,
                              (previousValue, element) =>
                                  previousValue +
                                  (element.price * element.quantity),
                            )
                          : 0,
                      builder: (context, totalSum) {
                        calculatedTotalSum = totalSum;

                        return Text(
                          '\$ ${totalSum.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkText,
                          ),
                        );
                      },
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
                    context.router
                        .push(CheckOutRoute(itemPrice: calculatedTotalSum));
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
      }

      return const Text('Error');
    });
  }
}
