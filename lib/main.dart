import 'package:brief_test_labmu/src/app/bloc/menu/menu_bloc.dart';
import 'package:brief_test_labmu/src/app/bloc/pokemon_fetch/pokemon_fetch_bloc.dart';
import 'package:brief_test_labmu/src/app/view/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MenuBloc()),
          BlocProvider(
            create: (_) => PokemonFetchBloc()..add(PokemonFetchEvent.get()),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
