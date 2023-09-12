import 'package:dio/dio.dart';
import 'package:flutter_case_bloc/models/cep_result.dart';

abstract class SearchCepRepository {
  Future<CepResult> searchCep(String cep);
}

class SearchCepRepositoryImp implements SearchCepRepository {
  @override
  Future<CepResult> searchCep(String cep) async {
    try {
      // Send an HTTP GET request to the ViaCEP API.
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');

      // Parse the JSON response into a CepResult.
      return CepResult.fromJson(response.data);
    } on DioException {
      // Handle Dio HTTP client exceptions (network or request issues).
      throw 'Bad CEP code';
    } catch (_) {
      // Handle other unexpected errors.
      throw 'Connection error';
    }
  }
}
