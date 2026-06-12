import 'package:brief_test_labmu/src/app/bloc/pokemon_favorite/pokemon_favorite_bloc.dart';
import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:brief_test_labmu/src/app/view/page/pokemon_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.isFavorite,
    required this.evolution,
  });
  final Pokemon pokemon;
  final bool isFavorite;
  final List<Pokemon> evolution;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final pokemonFavoriteBloc = context.read<PokemonFavoriteBloc>();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailPage(
              pokemon: pokemon,
              evolution: evolution,
              pokemonFavoriteBloc: pokemonFavoriteBloc,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 102,
        width: 328,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(pokemon.name, style: TextStyle(fontSize: 24)),
                  Row(
                    children: pokemon.typeOfPokemon
                        .map((e) => ElementSymbol(pokemonType: e.pokemonType))
                        .toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: pokemon.typeOfPokemon.first.pokemonType.color,
                    ),
                  ),

                  Center(child: CachedNetworkImage(imageUrl: pokemon.imageUrl)),

                  Positioned(
                    top: -7,
                    right: -7,
                    child: BlocBuilder<PokemonFavoriteBloc, PokemonFavoriteState>(
                      builder: (context, state) {
                        final favoriteBloc = context
                            .read<PokemonFavoriteBloc>();
                        return IconButton(
                          onPressed: () {
                            final favoriteBloc = context
                                .read<PokemonFavoriteBloc>();

                            final isFavorite = favoriteBloc.state.pokemons.any(
                              (e) => e.id == pokemon.id,
                            );

                            favoriteBloc.add(
                              PokemonFavoriteEvent.toggle(pokemon: pokemon),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFavorite
                                      ? '${pokemon.name} removed from favorites'
                                      : '${pokemon.name} added to favorites',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: favoriteBloc.isFavorite(pokemon.id)
                                ? Colors.red
                                : Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElementSymbol extends StatelessWidget {
  const ElementSymbol({super.key, required this.pokemonType});
  final PokemonType pokemonType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: pokemonType.color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(1),
            width: 25,
            height: 25.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(child: Icon(Icons.ac_unit, color: pokemonType.color)),
          ),
          SizedBox(width: 5),
          Text(pokemonType.name, style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}
