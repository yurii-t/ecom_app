import 'package:ecom_app/ui/home/home_screen/bloc/home_screen_bloc.dart';

import 'package:ecom_app/ui/widgets/item_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsRelatedList extends StatelessWidget {
  const ProductsRelatedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 267,
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is HomeScreenLoading) {
            return const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is HomeScreenLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              shrinkWrap: true,
              itemExtent: 183,
              itemBuilder: (context, index) {
                void _updateFavorite() {
                  final bool isFav = state.products[index].isFavorite;

                  context.read<HomeScreenBloc>().add(
                        HomeScreenProductFavoriteUpdate(
                          state.products[index],
                          !isFav,
                        ),
                      );
                }

                return ItemContainer(
                  product: state.products[index],
                  updateFavorite: _updateFavorite,
                );
              },
            );
          }

          return const Text('Error');
        },
      ),
    );
  }
}
