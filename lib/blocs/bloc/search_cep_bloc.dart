

import 'dart:async';

import 'package:bloc_flutter/blocs/bloc/search_cep_event.dart';
import 'package:bloc_flutter/blocs/bloc/search_cep_state.dart';

import '../../repository.dart';
import '../flutter_bloc/search_cep_flutter_bloc.dart';

class SearchCepBloc extends SearchCep {
  late final StreamSubscription _streamSubscription;
  final IRepository repository;
  SearchCepBloc({
    required this.repository,
  }) {
    _streamSubscription = _eventStreamController.stream.listen(_executeEvent);
  }

  final _stateStreamController = StreamController<SearchCepState>();
  Stream<SearchCepState> get stream => _stateStreamController.stream;

  final _eventStreamController = StreamController<SearchCepEvent>();
  Sink<SearchCepEvent> get eventStreamController => _eventStreamController.sink;

  void _executeEvent(SearchCepEvent event) async {

    if (event is ExecutingSearchCepEvent) {
    _stateStreamController.add(LoadingSearchCepState());
    _stateStreamController.add(await event(repository: repository));
  
    }
  }

  void dispose() {
    _eventStreamController.close();
    _stateStreamController.close();
    _streamSubscription.cancel();
  }
}
