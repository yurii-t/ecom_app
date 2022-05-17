part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchLoad extends SearchEvent {
  final String query;

  SearchLoad(this.query);
  @override
  List<Object> get props => [
        query,
      ];
}

class SearchUpdate extends SearchEvent {
  final List<Product> products;

  SearchUpdate(
    this.products,
  );

  @override
  List<Object> get props => [
        products,
      ];
}
