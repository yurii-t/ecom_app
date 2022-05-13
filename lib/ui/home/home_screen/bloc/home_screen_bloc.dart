import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app/data/models/product.dart';
import 'package:ecom_app/domain/reposittories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final ProductRepository productRepository;
  StreamSubscription? proudctSubscription;

  HomeScreenBloc({
    required this.productRepository,
    // required this.product
  }) : super(HomeScreenLoading()) {
    on<HomeScreenLoadProduct>(_onHomeScreenLoadProduct);
    on<HomeScreenUpdateProduct>(_onHomeScreenUpdateProduct);
    on<HomeScreenProductFavoriteUpdate>(_onHomeScreenProductFavoriteUpdate);
  }

  void _onHomeScreenLoadProduct(
    HomeScreenLoadProduct event,
    Emitter<HomeScreenState> emit,
  ) {
    proudctSubscription?.cancel();
    proudctSubscription = productRepository.getAllProducts().listen(
          (
            products,
          ) =>
              add(
            HomeScreenUpdateProduct(products),
          ),
        );
  }

  void _onHomeScreenUpdateProduct(
    HomeScreenUpdateProduct event,
    Emitter<HomeScreenState> emit,
  ) {
    emit(HomeScreenLoaded(products: event.products));
  }

  void _onHomeScreenProductFavoriteUpdate(
      HomeScreenProductFavoriteUpdate event, Emitter<HomeScreenState> emit) {
    // Product product= pr;
    // var fav = product.isFavorite;
    // event.isFavorite;
    // if (product.isFavorite == true) {}
    productRepository.updateProductFavorite(event.product, event.isFavorite);
    // emit(HomeScreenProductFavoriteUpdated(event.isFavorite, event.productId));
  }
}
