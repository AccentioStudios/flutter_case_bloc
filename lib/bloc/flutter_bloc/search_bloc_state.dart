part of 'search_bloc_bloc.dart';

@freezed
class SearchBlocState with _$SearchBlocState {
  const factory SearchBlocState.initial() = _Initial;
  const factory SearchBlocState.loaded(CepResult result) = _Loaded;
  const factory SearchBlocState.loading() = _Loading;
  const factory SearchBlocState.error(String message) = _Error;
}
