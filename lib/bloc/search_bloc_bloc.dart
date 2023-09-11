import 'package:bloc/bloc.dart';
import 'package:flutter_case_bloc/models/cep_result.dart';
import 'package:flutter_case_bloc/repository/search_cep_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';
part 'search_bloc_bloc.freezed.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  final SearchCepRepository repository;
  SearchBlocBloc({required this.repository}) : super(const _Initial()) {
    on<SearchBlocEvent>(
      (events, emit) async {
        await events.map(
          search: (event) async => _search(event, emit),
        );
      },
    );
  }
  void _search(event, emit) async {
    emit(const SearchBlocState.loading());
    try {
      final cep = event.cep;
      final result = await repository.searchCep(cep);
      emit(SearchBlocState.loaded(result));
    } catch (error) {
      emit(SearchBlocState.error(error.toString()));
    }
  }
}
