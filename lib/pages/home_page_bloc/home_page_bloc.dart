import 'package:bloc_flutter/blocs/flutter_bloc/search_cep_flutter_bloc.dart';
import 'package:bloc_flutter/pages/home_page_bloc/home_page_stream_builder_widget.dart';
import 'package:bloc_flutter/pages/home_page_bloc/home_page_top_buttons_widges.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc/search_cep_bloc.dart';
import '../../blocs/bloc/search_cep_event.dart';

class HomePageBloc extends StatefulWidget {
  final SearchCepBloc searchCepBloc;
  const HomePageBloc({
    Key? key,
    required this.searchCepBloc,
  }) : super(key: key);

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
  void dispose() {
    widget.searchCepBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CEP Search')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            HomePageTopButtonsWidget(textController: textController),
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
                child: const Text('Search'),
                onPressed: () {
                  widget.searchCepBloc.eventStreamController.add(ExecutingSearchCepEvent(cep: textController.text));
                }),
            const SizedBox(height: 16),
            HomePageStreamBuilderWidget(
                searchCepBloc: widget.searchCepBloc,
               ),
          ],
        ),
      ),
    );
  }
}
