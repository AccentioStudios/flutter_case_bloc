

import 'package:bloc_flutter/blocs/bloc/search_cep_state.dart';

import '../../address_model.dart';
import '../../repository.dart';

abstract class SearchCepEvent {}

class InitialSearchCepEvent extends SearchCepEvent {}

class ExecutingSearchCepEvent extends SearchCepEvent {
  final String cep;
  ExecutingSearchCepEvent({
    required this.cep,
  });
  Future<SearchCepState>call({required IRepository repository}) async {
    try {
      final AddressModel? address = await repository.searchAddress(cep: cep);
      if(address == null){
        return ErrorSearchCepState(message: 'cep não existe');
      }
      return SuccessSearchCepState(address: address);
    } catch (e) {
      return ErrorSearchCepState(message: e.toString());
    }
  }
}

class LoadingSearchCepEvent extends SearchCepEvent {}
