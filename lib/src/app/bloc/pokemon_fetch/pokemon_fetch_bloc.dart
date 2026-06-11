import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:brief_test_labmu/src/app/resource/pokemon_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_fetch_bloc.freezed.dart';

@freezed
class PokemonFetchState with _$PokemonFetchState {
  const factory PokemonFetchState.initial() = _Initial;
  const factory PokemonFetchState.loading() = _Loading;
  const factory PokemonFetchState.success({required List<Pokemon> pokemons}) =
      _Success;
  const factory PokemonFetchState.failure({String? message}) = _Failure;
}

@freezed
class PokemonFetchEvent with _$PokemonFetchEvent {
  const factory PokemonFetchEvent.get() = _Get;
}

class PokemonFetchBloc extends Bloc<PokemonFetchEvent, PokemonFetchState> {
  PokemonFetchBloc() : super(const PokemonFetchState.initial()) {
    on<PokemonFetchEvent>((event, emit) async {
      await event.when(
        get: () async {
          emit(const PokemonFetchState.loading());
          try {
            final pokemons = await PokemonApiProvider.instance.pokemons();

            emit(PokemonFetchState.success(pokemons: pokemons));
          } catch (error) {
            print(error.toString());
            emit(PokemonFetchState.failure(message: error.toString()));
          }
        },
      );
    });
  }
}
