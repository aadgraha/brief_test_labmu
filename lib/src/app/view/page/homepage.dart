import 'package:brief_test_labmu/src/app/bloc/menu/menu_bloc.dart';
import 'package:brief_test_labmu/src/app/view/page/pokedex.dart';
import 'package:brief_test_labmu/src/app/view/page/pokemon_favorite.dart';
import 'package:brief_test_labmu/src/app/view/widget/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          switch (state.selectedIndex) {
            case 0:
              return const PokedexPage();
            case 1:
              return const PokemonFavoritePage();
            default:
              return const PokedexPage();
          }
        },
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
