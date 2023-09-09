import 'package:dio/dio.dart';

import 'address_model.dart';

abstract class IRepository {
  Future<AddressModel?> searchAddress({required String cep});
}

class AddressRepositoryImpl extends IRepository {
  @override
  Future<AddressModel?> searchAddress({required String cep}) async {
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');

      return AddressModel.fromMap(response.data);
    } on DioException {
      throw 'Você Digitou o CEP Errado';
    } catch (e) {
      throw 'Erro Desconhecido';
    }
  }
}
