import 'package:dio/dio.dart';

abstract class Api {
  static const String pokemonUrl =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw';

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: pokemonUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  );
}
