import 'package:brief_test_labmu/src/app/bloc/menu/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Container(
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _item(
                context,
                index: 0,
                isSelected: state.selectedIndex == 0,
                selectedIcon: 'assets/navbar/pokedex_sel.png',
                unselectedIcon: 'assets/navbar/pokedex_unsel.png',
              ),
              _item(
                context,
                index: 1,
                isSelected: state.selectedIndex == 1,
                selectedIcon: 'assets/navbar/favorite_sel.png',
                unselectedIcon: 'assets/navbar/favorite_unsel.png',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _item(
    BuildContext context, {
    required int index,
    required bool isSelected,
    required String selectedIcon,
    required String unselectedIcon,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<MenuBloc>().add(MenuChanged(index));
      },
      child: Image.asset(
        isSelected ? selectedIcon : unselectedIcon,
        width: 50,
        height: 50,
      ),
    );
  }
}
