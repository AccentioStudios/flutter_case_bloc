import 'package:bloc_flutter/repository.dart';
import 'package:flutter/material.dart';
import 'blocs/bloc/search_cep_bloc.dart';
import 'pages/home_page_bloc/home_page_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePageBloc(searchCepBloc: SearchCepBloc(repository: AddressRepositoryImpl())),
    );
  }
}
