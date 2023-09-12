import 'package:flutter/material.dart';
import 'package:flutter_case_bloc/models/cep_result.dart';

class ShowResultCep extends StatelessWidget {
  final CepResult cepResult;
  const ShowResultCep(
    this.cepResult, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('CEP: ${cepResult.cep}'),
        Text('Logradouro: ${cepResult.logradouro}'),
        Text('Complemento: ${cepResult.complemento}'),
        Text('Bairro: ${cepResult.bairro}'),
        Text('Localidade: ${cepResult.localidade}'),
        Text('UF: ${cepResult.uf}'),
        Text('IBGE: ${cepResult.ibge}'),
        Text('GIA: ${cepResult.gia}'),
        Text('DDD: ${cepResult.ddd}'),
        Text('SIAFI: ${cepResult.siafi}'),
      ],
    );
  }
}
