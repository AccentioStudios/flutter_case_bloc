// import 'package:bloc/pages/home_page_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_case_bloc/bloc/flutter_bloc/search_bloc_bloc.dart';
// import 'package:flutter_case_bloc/pages/home_page.dart';
import 'package:flutter_case_bloc/pages/home_page_bloc.dart';
import 'package:flutter_case_bloc/repository/search_cep_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repository = SearchCepRepositoryImp();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // ? Bloc
      home: const HomePageBloc(),

      // ! Flutter_Bloc
      // home: BlocProvider(
      //   create: (context) => SearchBlocBloc(repository: repository),
      //   child: const HomePageBloc(),
      // ),
    );
  }
}
