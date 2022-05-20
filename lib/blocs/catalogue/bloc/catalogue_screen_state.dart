part of 'catalogue_screen_bloc.dart';

abstract class CatalogueScreenState extends Equatable {
  const CatalogueScreenState();

  @override
  List<Object> get props => [];
}

class CatalogueScreenLoading extends CatalogueScreenState {}

class CatalogueScreenLoaded extends CatalogueScreenState {
  final List<Catalogue> catalogue;

  const CatalogueScreenLoaded({this.catalogue = const <Catalogue>[]});

  @override
  List<Object> get props => [catalogue];
}
