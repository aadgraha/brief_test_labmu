import 'package:brief_test_labmu/src/app/bloc/pokemon_favorite/pokemon_favorite_bloc.dart';
import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:brief_test_labmu/src/app/view/widget/pokemon_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({
    super.key,
    required this.pokemon,
    required this.evolution,
    required this.pokemonFavoriteBloc,
  });
  final Pokemon pokemon;
  final List<Pokemon> evolution;
  final PokemonFavoriteBloc pokemonFavoriteBloc;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: pokemon.typeOfPokemon.first.pokemonType.color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.chevron_left, color: Colors.white),
                  ),
                  BlocBuilder<PokemonFavoriteBloc, PokemonFavoriteState>(
                    bloc: pokemonFavoriteBloc,
                    builder: (context, state) {
                      final isFavorite = pokemonFavoriteBloc.isFavorite(
                        pokemon.id,
                      );

                      return IconButton(
                        onPressed: () {
                          pokemonFavoriteBloc.add(
                            PokemonFavoriteEvent.toggle(pokemon: pokemon),
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: pokemon.typeOfPokemon.first.pokemonType.color,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 130,
                          width: 130,
                          child: CachedNetworkImage(imageUrl: pokemon.imageUrl),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text(pokemon.name, style: TextStyle(fontSize: 48)),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: pokemon.typeOfPokemon
                        .map((e) => ElementSymbol(pokemonType: e.pokemonType))
                        .toList(),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text(
                      '${pokemon.xDescription} ${pokemon.yDescription}',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: PokemonStat(
                          icon: Icons.scale,
                          label: 'Weight',
                          value: pokemon.weight,
                        ),
                      ),
                      Expanded(
                        child: PokemonStat(
                          icon: Icons.height,
                          label: 'Height',
                          value: pokemon.height,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PokemonStat(
                          icon: Icons.category,
                          label: 'Category',
                          value: pokemon.category,
                        ),
                      ),
                      Expanded(
                        child: PokemonStat(
                          icon: Icons.snowing,
                          label: 'Ability',
                          value: pokemon.abilities.first,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text('Weakness', style: TextStyle(fontSize: 28)),
                  ),
                  Wrap(
                    children: pokemon.weaknesses
                        .map((e) => ElementSymbol(pokemonType: e.pokemonType))
                        .toList(),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text('Evolution', style: TextStyle(fontSize: 28)),
                  ),
                  SizedBox(height: 10),
                  ...pokemon.evolutions.asMap().entries.map((entry) {
                    final index = entry.key;
                    final isLast = index == pokemon.evolutions.length - 1;

                    return EvolutionTree(
                      pokemon: evolution[index],
                      isLast: isLast,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EvolutionTree extends StatelessWidget {
  const EvolutionTree({super.key, required this.pokemon, required this.isLast});

  final Pokemon pokemon;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 96,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(76)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: pokemon.typeOfPokemon.first.pokemonType.color,
                      borderRadius: BorderRadius.all(Radius.circular(76)),
                    ),
                    child: Builder(
                      builder: (context) {
                        final path = pokemon.imageUrl;
                        return CachedNetworkImage(imageUrl: path);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pokemon.name, style: TextStyle(fontSize: 22)),
                      Wrap(
                        children: pokemon.typeOfPokemon
                            .map(
                              (e) => ElementSymbol(pokemonType: e.pokemonType),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(visible: !isLast, child: SizedBox(height: 10)),
          Visibility(
            visible: !isLast,
            child: Icon(Icons.arrow_downward, color: Colors.blue, size: 35),
          ),
        ],
      ),
    );
  }
}

class PokemonStat extends StatelessWidget {
  const PokemonStat({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              SizedBox(width: 3),
              Text(
                label,
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
