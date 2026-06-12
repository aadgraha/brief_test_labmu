import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:brief_test_labmu/src/app/resource/pokemon_api_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'pokemon_fetch_bloc.freezed.dart';

@freezed
abstract class PokemonFetchState with _$PokemonFetchState {
  const factory PokemonFetchState.initial() = _Initial;
  const factory PokemonFetchState.loading() = _Loading;
  const factory PokemonFetchState.success({required List<Pokemon> pokemons}) =
      _Success;
  const factory PokemonFetchState.failure({String? message}) = _Failure;
}

@freezed
abstract class PokemonFetchEvent with _$PokemonFetchEvent {
  const factory PokemonFetchEvent.get() = _Get;
  const factory PokemonFetchEvent.refresh() = _Refresh;
}

class PokemonFetchBloc
    extends HydratedBloc<PokemonFetchEvent, PokemonFetchState> {
  PokemonFetchBloc() : super(const PokemonFetchState.initial()) {
    on<_Get>(_onGet);
    on<_Refresh>(_onRefresh);
  }

  Future<void> _onGet(_Get event, Emitter<PokemonFetchState> emit) async {
    if (state is _Success) return;
    await _fetch(emit);
  }

  Future<void> _onRefresh(
    _Refresh event,
    Emitter<PokemonFetchState> emit,
  ) async {
    await _fetch(emit);
  }

  Future<void> _fetch(Emitter<PokemonFetchState> emit) async {
    final currentState = state;

    if (currentState is! _Success) {
      emit(const PokemonFetchState.loading());
    }

    try {
      final pokemons = await PokemonApiProvider.instance.pokemons();

      emit(PokemonFetchState.success(pokemons: pokemons));
    } catch (error) {
      if (currentState is! _Success) {
        emit(PokemonFetchState.failure(message: error.toString()));
      }
    }
  }

  @override
  PokemonFetchState? fromJson(Map<String, dynamic> json) {
    try {
      return PokemonFetchState.success(
        pokemons: (json['pokemons'] as List)
            .map((e) => Pokemon.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PokemonFetchState state) {
    return state.maybeWhen(
      success: (pokemons) => {
        'pokemons': pokemons.map((e) => e.toJson()).toList(),
      },
      orElse: () => null,
    );
  }
}
