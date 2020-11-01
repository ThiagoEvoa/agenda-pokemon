import 'package:agenda_pokemon/presentation/ui/splash_screen.dart';
import 'package:agenda_pokemon/presentation/viewmodel/pokebook_viewmodel.dart';
import 'package:agenda_pokemon/presentation/viewmodel/pokemon_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokeBookViewModel()),
        ChangeNotifierProvider(create: (_) => PokemonViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
