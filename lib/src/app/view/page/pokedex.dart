import 'package:brief_test_labmu/src/app/bloc/pokemon_fetch/pokemon_fetch_bloc.dart';
import 'package:brief_test_labmu/src/app/view/widget/pokemon_card.dart';
import 'package:brief_test_labmu/src/app/view/widget/pokemon_type_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  var _searchValue = '';
  var _searchType = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFetchBloc, PokemonFetchState>(
      builder: (context, state) {
        return SafeArea(
          child: state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (pokemons) {
              final filteredPokemons = pokemons.where((pokemon) {
                final matchesName =
                    _searchValue.isEmpty ||
                    pokemon.name.toLowerCase().contains(
                      _searchValue.toLowerCase(),
                    ) ||
                    pokemon.typeOfPokemon
                        .join("")
                        .toLowerCase()
                        .contains(_searchValue.toLowerCase());

                final matchesType =
                    _searchType.isEmpty ||
                    _searchType == 'alltype' ||
                    pokemon.typeOfPokemon.any(
                      (type) => type.toLowerCase() == _searchType.toLowerCase(),
                    );

                return matchesName && matchesType;
              }).toList()..sort((a, b) => a.id.compareTo(b.id));

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: TextField(
                      onChanged: (value) {
                        _searchValue = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Pokémon',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<PokemonFetchBloc>().add(
                          const PokemonFetchEvent.refresh(),
                        );
                      },
                      child: ListView(
                        children: [
                          PokemonTypeButton(
                            activeLabel: _searchType.isEmpty
                                ? 'ALLTYPE'
                                : _searchType.toUpperCase(),
                            onTap: (type) {
                              if (type.name == 'alltype') {
                                _searchType = '';
                              } else {
                                _searchType = type.name.toLowerCase();
                              }
                              setState(() {});
                            },
                          ),
                          SizedBox(height: 10),
                          ...filteredPokemons.map((e) {
                            final evoIds = e.evolutions.toSet();
                            final evolutionPokemons = pokemons
                                .where((pokemon) => evoIds.contains(pokemon.id))
                                .toList();
                            return PokemonCard(
                              pokemon: e,
                              isFavorite: true,
                              evolution: evolutionPokemons,
                            );
                          }),
                        ],
                      ),
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
