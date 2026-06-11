import 'package:flutter/material.dart';

enum PokemonType {
  allType,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
}

class PokemonTypeButton extends StatelessWidget {
  const PokemonTypeButton({super.key, this.onTap, required this.activeLabel});
  final void Function(PokemonType)? onTap;
  final String activeLabel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PokemonType>(
      position: PopupMenuPosition.under,
      offset: const Offset(25, 0),
      constraints: const BoxConstraints(maxHeight: 300, minWidth: 200),
      icon: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              activeLabel,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const Icon(Icons.filter_list, color: Colors.white),
          ],
        ),
      ),
      onSelected: onTap,
      itemBuilder: (context) {
        return PokemonType.values.map((type) {
          return PopupMenuItem(
            value: type,
            child: Text(type.name.toUpperCase()),
          );
        }).toList();
      },
    );
  }
}

//optimise chced, bookmark fitur