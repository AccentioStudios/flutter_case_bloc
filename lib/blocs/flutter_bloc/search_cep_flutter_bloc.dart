import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository.dart';
import '../bloc/search_cep_event.dart';
import '../bloc/search_cep_state.dart';
abstract class SearchCep {

}

class SearchCepFlutterBloc extends Bloc<SearchCepEvent, SearchCepState> implements SearchCep {
  final IRepository repository;
  SearchCepFlutterBloc({
    required this.repository
    }): super(InitialSearchCepState()) {
    on<ExecutingSearchCepEvent>((event, emit) async {
      
      emit(LoadingSearchCepState());
      emit(await event(repository: repository));
    });
  }

  void dispose() {
    close();
  }
}
