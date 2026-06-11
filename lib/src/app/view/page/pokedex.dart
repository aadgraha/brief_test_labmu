import 'package:brief_test_labmu/src/app/bloc/pokemon_fetch/pokemon_fetch_bloc.dart';
import 'package:brief_test_labmu/src/app/view/widget/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  var _searchValue = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFetchBloc, PokemonFetchState>(
      builder: (context, state) {
        return SafeArea(
          child: state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (pokemons) {
              final filteredPokemons = _searchValue.isEmpty
                  ? pokemons
                  : pokemons
                        .where(
                          (e) => e.name.toLowerCase().contains(
                            _searchValue.toLowerCase(),
                          ),
                        )
                        .toList();

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(5),
                    child: TextField(
                      onChanged: (value) {
                        _searchValue = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(hint: Text('Search')),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: filteredPokemons.map((e) {
                        return PokemonCard(pokemon: e, isFavorite: true);
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
            failure: (message) => Text(message ?? ''),
          ),
        );
      },
    );
  }
}
