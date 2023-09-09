import 'package:bloc_flutter/blocs/bloc/search_cep_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../blocs/bloc/search_cep_state.dart';

class HomePageStreamBuilderWidget extends StatefulWidget {
  
  final SearchCepBloc searchCepBloc;
   const HomePageStreamBuilderWidget({
    Key? key,

    required this.searchCepBloc,
  }) : super(key: key);

  @override
  State<HomePageStreamBuilderWidget> createState() => _HomePageStreamBuilderWidgetState();
}

class _HomePageStreamBuilderWidgetState extends State<HomePageStreamBuilderWidget> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<SearchCepState>(
      initialData: InitialSearchCepState(),
      stream: widget.searchCepBloc.stream,
      builder: (context, state) {
        final data = state.data;

        if (data is InitialSearchCepState) {
          return const Text('Digite ou escolha um CEP');
        } else if (data is LoadingSearchCepState) {
          return const Center(child: CircularProgressIndicator());
        } else if (data is SuccessSearchCepState) {
          return Column(
            children: [
              Text('CEP: ${data.address.cep}'),
              Text('Logradouro: ${data.address.logradouro}'),
              Text('Complemento: ${data.address.complemento}'),
              Text('Bairro: ${data.address.bairro}'),
              Text('Localidade: ${data.address.localidade}'),
              Text('UF: ${data.address.uf}'),
              Text('IBGE: ${data.address.ibge}'),
              Text('GIA: ${data.address.gia}'),
              Text('DDD: ${data.address.ddd}'),
              Text('SIAFI: ${data.address.siafi}'),
            ],
          );
        } else if (data is ErrorSearchCepState) {
          return Text(data.message);
        } else {
          if (kDebugMode) {
            return const Text('Algum State Não Esta Sendo Tratado');
          }
          return const Text('Erro Desconhecido');
        }
      },
    );
  }
}
