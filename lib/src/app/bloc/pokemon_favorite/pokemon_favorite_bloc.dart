import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'pokemon_favorite_bloc.freezed.dart';

@freezed
abstract class PokemonFavoriteState with _$PokemonFavoriteState {
  const factory PokemonFavoriteState.success({
    required List<Pokemon> pokemons,
  }) = _Success;
}

@freezed
abstract class PokemonFavoriteEvent with _$PokemonFavoriteEvent {
  const factory PokemonFavoriteEvent.toggle({required Pokemon pokemon}) =
      _Toggle;
}

class PokemonFavoriteBloc
    extends HydratedBloc<PokemonFavoriteEvent, PokemonFavoriteState> {
  PokemonFavoriteBloc()
    : super(const PokemonFavoriteState.success(pokemons: [])) {
    on<_Toggle>((event, emit) {
      final currentPokemons = state.pokemons;

      final isFavorite = currentPokemons.any((e) => e.id == event.pokemon.id);

      emit(
        PokemonFavoriteState.success(
          pokemons: isFavorite
              ? currentPokemons.where((e) => e.id != event.pokemon.id).toList()
              : [...currentPokemons, event.pokemon],
        ),
      );
    });
  }

  @override
  PokemonFavoriteState? fromJson(Map<String, dynamic> json) {
    try {
      return PokemonFavoriteState.success(
        pokemons: (json['pokemons'] as List)
            .map((e) => Pokemon.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (_) {
      return const PokemonFavoriteState.success(pokemons: []);
    }
  }

  @override
  Map<String, dynamic>? toJson(PokemonFavoriteState state) {
    return {'pokemons': state.pokemons.map((e) => e.toJson()).toList()};
  }

  bool isFavorite(String id) {
    return state.pokemons.any((e) => e.id == id);
  }
}
