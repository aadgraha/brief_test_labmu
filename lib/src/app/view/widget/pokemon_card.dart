import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.isFavorite,
  });
  final Pokemon pokemon;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      .map(
                        (e) => ElementSymbol(
                          pokemonType: e.pokemonType,
                          assetName: '',
                          elementName: '',
                        ),
                      )
                      .toList(),
                ),
                // ElementSymbol(
                //   pokemonType: pokemon.typeOfPokemon.first.pokemonType,
                //   assetName: '',
                //   elementName: '',
                // ),
              ],
            ),
          ),
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(15)),
          //       color: pokemon.typeOfPokemon.first.pokemonType.color,
          //     ),
          //     child: CachedNetworkImage(imageUrl: pokemon.imageUrl),
          //   ),
          // ),
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
                  child: IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: pokemon.isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ElementSymbol extends StatelessWidget {
  const ElementSymbol({
    super.key,
    required this.pokemonType,
    required this.assetName,
    required this.elementName,
  });
  final PokemonType pokemonType;
  final String assetName;
  final String elementName;

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
        children: [
          Container(
            padding: EdgeInsets.all(2),
            width: 25,
            height: 25.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(child: Image.asset("assets/element/bug.png")),
          ),
          SizedBox(width: 5),
          Text(pokemonType.name, style: TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}
