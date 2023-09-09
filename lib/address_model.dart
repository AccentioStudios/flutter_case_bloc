import 'dart:convert';

class AddressModel {
  final String localidade;
  final String uf;
  final String cep;
  final String logradouro;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;
  final String bairro;
  final String complemento;

  AddressModel({
    required this.localidade,
    required this.uf,
    required this.cep,
    required this.logradouro,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
    required this.bairro,
    required this.complemento,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      ibge: map['ibge'] as String,
      gia: map['gia'] as String,
      ddd: map['ddd'] as String,
      siafi: map['siafi'] as String,
      bairro: map['bairro'] as String,
      complemento: map['complemento'] as String,
    );
  }
 
  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
