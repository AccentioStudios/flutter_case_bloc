import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_case_bloc/models/cep_result.dart';
import 'package:flutter_case_bloc/repository/search_cep_repository.dart';

sealed class CepEvent {}

class SearchCepEvent extends CepEvent {
  final String cep;
  SearchCepEvent({required this.cep});
}

sealed class CepState {}

class CepInitial implements CepState {}

class CepLoading implements CepState {}

class CepLoaded implements CepState {
  final CepResult result;

  CepLoaded(this.result);
}

class CepError implements CepState {}

class SearchCepBloc extends Bloc<SearchCepEvent, CepState> {
  final SearchCepRepository repository;

  SearchCepBloc(this.repository) : super(CepInitial()) {
    on<SearchCepEvent>(loadResult);
  }

  Future<void> loadResult(SearchCepEvent event, Emitter emitter) async {
    emitter(CepLoading());
    try {
      final result = await repository.searchCep(event.cep);
      emitter(CepLoaded(result));
    } catch (e) {
      emitter(CepError());
    }
  }
}
