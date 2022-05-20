import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app/data/models/product.dart';
import 'package:ecom_app/domain/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRepository productRepository;
  StreamSubscription? productSubscription;
  SearchBloc({required this.productRepository}) : super(SearchLoading()) {
    on<SearchLoad>(_onSearchLoad);
    on<SearchUpdate>(_onSearchUpdate);
  }

  void _onSearchLoad(
    SearchLoad event,
    Emitter<SearchState> emit,
  ) {
    productSubscription = productRepository.searchProducts(event.query).listen((
      products,
    ) {
      if (event.query != '') {
        add(
          SearchUpdate(products),
        );
      } else {
        add(const SearchUpdate([]));
      }
    });
  }

  void _onSearchUpdate(
    SearchUpdate event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchLoaded(products: event.products));
  }

  @override
  Future<void> close() {
    productSubscription?.cancel();

    return super.close();
  }
}
