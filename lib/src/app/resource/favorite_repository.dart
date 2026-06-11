// import 'package:shared_preferences/shared_preferences.dart';

// class FavoriteRepository {
//   static const _key = 'favorite_pokemon_ids';

//   static Future<Set<String>> getFavorites() async {
//     final prefs = await SharedPreferences.getInstance();

//     return prefs.getStringList(_key)?.toSet() ?? {};
//   }

//   static Future<void> add(String pokemonId) async {
//     final prefs = await SharedPreferences.getInstance();

//     final favorites = await getFavorites();

//     favorites.add(pokemonId);

//     await prefs.setStringList(
//       _key,
//       favorites.toList(),
//     );
//   }

//   static Future<void> remove(String pokemonId) async {
//     final prefs = await SharedPreferences.getInstance();

//     final favorites = await getFavorites();

//     favorites.remove(pokemonId);

//     await prefs.setStringList(
//       _key,
//       favorites.toList(),
//     );
//   }

//   static Future<bool> isFavorite(String pokemonId) async {
//     final favorites = await getFavorites();

//     return favorites.contains(pokemonId);
//   }

//   static Future<void> toggle(String pokemonId) async {
//     final favorites = await getFavorites();

//     if (favorites.contains(pokemonId)) {
//       await remove(pokemonId);
//     } else {
//       await add(pokemonId);
//     }
//   }
// }