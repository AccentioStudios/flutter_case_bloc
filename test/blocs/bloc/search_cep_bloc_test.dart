

import 'package:bloc_flutter/address_model.dart';
import 'package:bloc_flutter/blocs/bloc/search_cep_bloc.dart';
import 'package:bloc_flutter/blocs/bloc/search_cep_event.dart';
import 'package:bloc_flutter/blocs/bloc/search_cep_state.dart';
import 'package:bloc_flutter/repository.dart';
import 'package:flutter_test/flutter_test.dart';

class AddressRepositoryMock extends IRepository {
  @override
  Future<AddressModel> searchAddress({required String cep}) async {
    
    return AddressModel(localidade: 'localidade', uf: 'uf', cep: 'cep', logradouro: 'logradouro', ibge: 'ibge', gia: 'gia', ddd: 'ddd', siafi: 'siafi', bairro: 'bairro', complemento: 'complemento');
  }
  
}


void main() {
  test('Test ExecutingSearchCepEvent deve retornar ( LoadingSearchCepState, SuccessSearchCepState )', () async {
    final flutterBloc = SearchCepBloc(repository: AddressRepositoryMock());
    flutterBloc.eventStreamController.add(ExecutingSearchCepEvent(cep: 'cep')); 
    await expectLater(flutterBloc.stream, emitsInOrder([ isA<LoadingSearchCepState>(), isA<SuccessSearchCepState>()]));
  });
 
  test('Test error ExecutingSearchCepEvent deve retornar ( ErrorSearchCepState )  (DioException)', () async {
    final flutterBloc = SearchCepBloc(repository: AddressRepositoryImpl());
    flutterBloc.eventStreamController.add(ExecutingSearchCepEvent(cep: 'sdw222'));
    await expectLater(flutterBloc.stream, emitsInOrder([ isA<LoadingSearchCepState>(), isA<ErrorSearchCepState>()]));
  });
}