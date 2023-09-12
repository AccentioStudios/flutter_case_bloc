part of 'search_bloc_bloc.dart';

@freezed
class SearchBlocEvent with _$SearchBlocEvent {
  const factory SearchBlocEvent.search(String cep) = _Search;
}
