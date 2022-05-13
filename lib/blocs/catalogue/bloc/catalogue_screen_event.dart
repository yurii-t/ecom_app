part of 'catalogue_screen_bloc.dart';

abstract class CatalogueScreenEvent extends Equatable {
  const CatalogueScreenEvent();

  @override
  List<Object> get props => [];
}

class CatalogueScreenLoad extends CatalogueScreenEvent {}

class CatalogueScreenUpdate extends CatalogueScreenEvent {
  final List<Catalogue> catalogue;

  CatalogueScreenUpdate(this.catalogue);
  @override
  List<Object> get props => [catalogue];
}
