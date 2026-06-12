import 'package:brief_test_labmu/src/app/bloc/pokemon_favorite/pokemon_favorite_bloc.dart';
import 'package:brief_test_labmu/src/app/bloc/pokemon_fetch/pokemon_fetch_bloc.dart';
import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:brief_test_labmu/src/app/view/widget/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonFavoritePage extends StatelessWidget {
  const PokemonFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 67,
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'Favorites',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: BlocBuilder<PokemonFetchBloc, PokemonFetchState>(
              builder: (context, stateFetch) {
                return BlocBuilder<PokemonFavoriteBloc, PokemonFavoriteState>(
                  builder: (context, state) {
                    final pokemons = stateFetch.maybeWhen(
                      orElse: () => <Pokemon>[],
                      success: (pokemons) => pokemons,
                    );
                    return ListView(
                      children: [
                        ...state.pokemons.map((e) {
                          final evoIds = e.evolutions.toSet();
                          final evolutionPokemons = pokemons
                              .where((pokemon) => evoIds.contains(pokemon.id))
                              .toList();
                          return PokemonCard(
                            pokemon: e,
                            isFavorite: context
                                .read<PokemonFavoriteBloc>()
                                .isFavorite(e.id),
                            evolution: evolutionPokemons,
                          );
                        }),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
