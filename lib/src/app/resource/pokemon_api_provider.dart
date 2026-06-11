import 'dart:convert';

import 'package:brief_test_labmu/src/app/model/pokemon.dart';
import 'package:brief_test_labmu/src/app/resource/base_api.dart';
import 'package:dio/dio.dart';

class PokemonApiProvider {
  PokemonApiProvider({required this.dio});

  final Dio dio;

  static PokemonApiProvider instance = PokemonApiProvider(dio: Api.dio);

  Future<List<Pokemon>> pokemons() async {
    try {
      final response = await dio.get('/pokemons.json');
      final encodedResponse = jsonDecode(response.data) as List<dynamic>;
      return encodedResponse
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
