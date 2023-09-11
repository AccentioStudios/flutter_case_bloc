import 'package:dio/dio.dart';
import 'package:flutter_case_bloc/models/cep_result.dart';

abstract class SearchCepRepository {
  Future<CepResult> searchCep(String cep);
}

class SearchCepRepositoryImp implements SearchCepRepository {
  @override
  Future<CepResult> searchCep(String cep) async {
    final response = await Dio()
        .get('https://viacep.com.br/ws/$cep/json/')
        .catchError((error) => throw 'Invalid CEP');

    if (response.statusCode == 200) {
      return response.data['erro'] == 'true'
          ? throw 'CEP not found'
          : CepResult.fromJson(response.data);
    }
    throw 'Connection error';
  }
}
