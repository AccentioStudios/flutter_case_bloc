
import 'package:bloc_flutter/address_model.dart';
import 'package:bloc_flutter/blocs/bloc/search_cep_event.dart';
import 'package:bloc_flutter/blocs/bloc/search_cep_state.dart';
import 'package:bloc_flutter/repository.dart';
import 'package:flutter_test/flutter_test.dart';


class AddressRepositoryMock extends IRepository {
  @override
  Future<AddressModel?> searchAddress({required String cep}) async {
    Map<String, AddressModel> map = { 
      '44420000': AddressModel(localidade: 'localidade', uf: 'uf', cep: '44420000', logradouro: 'logradouro', ibge: 'ibge', gia: 'gia', ddd: 'ddd', siafi: 'siafi', bairro: 'bairro', complemento: 'complemento'),
     };
    
    return map[cep];
  }
  
}


void main() {

  test('Test resultado success do evento', () async {
    final ExecutingSearchCepEvent event = ExecutingSearchCepEvent(cep: '44420000');
    final SearchCepState state = await event(repository: AddressRepositoryMock());
    expect(state, isA<SuccessSearchCepState>());
    expect((state as SuccessSearchCepState).address.cep, '44420000');
  });
  test('Test resultado error do evento', () async {
    final ExecutingSearchCepEvent event = ExecutingSearchCepEvent(cep: '444000');
    final SearchCepState state = await event(repository: AddressRepositoryMock());
    expect(state, isA<ErrorSearchCepState>());
    expect((state as ErrorSearchCepState).message, 'cep não existe');
  });
 

}