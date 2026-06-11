import 'package:brief_test_labmu/src/app/bloc/pokemon_fetch/pokemon_fetch_bloc.dart';
import 'package:brief_test_labmu/src/app/view/widget/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFetchBloc, PokemonFetchState>(
      builder: (context, state) {
        return SafeArea(
          child: state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (pokemons) => ListView(
              children: pokemons.map((e) => PokemonCard(pokemon: e)).toList(),
            ),
            failure: (message) => Text(message ?? ''),
          ),
        );
      },
    );
  }
}
