import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_bloc/bloc/search_bloc_bloc.dart';
import 'package:flutter_case_bloc/models/cep_result.dart';
import 'package:flutter_case_bloc/widgets/show_result.dart';

class HomePageBloc extends StatefulWidget {
  const HomePageBloc({super.key});

  @override
  State<HomePageBloc> createState() => _HomePageBlocState();
}

class _HomePageBlocState extends State<HomePageBloc> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP Search'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(children: [
              ActionChip(
                label: const Text('01001000'),
                onPressed: () {
                  textController.text = '01001000';
                  _searchCep();
                  // TO-DO: Busca el CEP en la API
                  // TO-DO: Busca o CEP na API
                },
              ),
              const SizedBox(width: 8),
              ActionChip(
                label: const Text('01001001'),
                onPressed: () {
                  textController.text = '01001001';
                  _searchCep();

                  // TO-DO: Busca el CEP en la API
                  // TO-DO: Busca o CEP na API
                },
              ),
              const SizedBox(width: 8),
              ActionChip(
                label: const Text('01001010'),
                onPressed: () {
                  textController.text = '01001010';
                  _searchCep();

                  // TO-DO: Busca el CEP en la API
                  // TO-DO: Busca o CEP na API
                },
              ),
            ]),
            const SizedBox(height: 16),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CEP',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _searchCep();
                // TO-DO: Busca el CEP en la API
                // TO-DO: Busca o CEP na API
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 16),

            // TO-DO: Crea un widget que renderiza el resultado de la búsqueda
            // TO-DO: Cria um widget que renderiza o resultado da busca

            BlocBuilder<SearchBlocBloc, SearchBlocState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const CircularProgressIndicator(),
                  loaded: (CepResult result) => ShowResultCep(result),
                  error: (message) => Center(
                    child: Text("Error: $message"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _searchCep() {
    final cepId = textController.text;
    BlocProvider.of<SearchBlocBloc>(context).add(SearchBlocEvent.search(cepId));
  }
}
