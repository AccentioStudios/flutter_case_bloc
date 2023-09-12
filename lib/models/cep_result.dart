import 'package:freezed_annotation/freezed_annotation.dart';

part 'cep_result.freezed.dart';
part 'cep_result.g.dart';

@freezed
class CepResult with _$CepResult {
  factory CepResult({
    required String cep,
    required String logradouro,
    required String complemento,
    required String bairro,
    required String localidade,
    required String uf,
    required String ibge,
    required String gia,
    required String ddd,
    required String siafi,
  }) = _CepResult;

  factory CepResult.fromJson(Map<String, dynamic> json) =>
      _$CepResultFromJson(json);
}
