// ignore_for_file: avoid-unused-parameters
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app/data/models/catalogue.dart';
import 'package:ecom_app/domain/repositories/catalogue/catalogue_repository.dart';
import 'package:equatable/equatable.dart';

part 'catalogue_screen_event.dart';
part 'catalogue_screen_state.dart';

class CatalogueScreenBloc
    extends Bloc<CatalogueScreenEvent, CatalogueScreenState> {
  final CatalogueRepository catalogueRepository;
  StreamSubscription? catalogueSubscription;
  CatalogueScreenBloc({required this.catalogueRepository})
      : super(CatalogueScreenLoading()) {
    on<CatalogueScreenLoad>(_onCatalogueScreenLoad);
    on<CatalogueScreenUpdate>(_onCatalogueScreenUpdate);
  }

  void _onCatalogueScreenLoad(
    CatalogueScreenLoad event,
    Emitter<CatalogueScreenState> emit,
  ) {
    catalogueSubscription = catalogueRepository.getAllCatalogue().listen(
          (catalogue) => add(CatalogueScreenUpdate(catalogue)),
        );
  }

  void _onCatalogueScreenUpdate(
    CatalogueScreenUpdate event,
    Emitter<CatalogueScreenState> emit,
  ) {
    emit(CatalogueScreenLoaded(catalogue: event.catalogue));
  }

  @override
  Future<void> close() {
    catalogueSubscription?.cancel();

    return super.close();
  }
}
