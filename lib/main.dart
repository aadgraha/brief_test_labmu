import 'package:brief_test_labmu/src/app/bloc/menu/menu_bloc.dart';
import 'package:brief_test_labmu/src/app/bloc/pokemon_favorite/pokemon_favorite_bloc.dart';
import 'package:brief_test_labmu/src/app/bloc/pokemon_fetch/pokemon_fetch_bloc.dart';
import 'package:brief_test_labmu/src/app/view/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(appDocDir.path),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MenuBloc()),
          BlocProvider(
            create: (_) => PokemonFetchBloc()..add(PokemonFetchEvent.get()),
          ),
          BlocProvider(create: (_) => PokemonFavoriteBloc()),
        ],
        child: HomePage(),
      ),
    );
  }
}
