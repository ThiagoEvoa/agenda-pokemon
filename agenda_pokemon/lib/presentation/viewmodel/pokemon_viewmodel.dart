import 'package:agenda_pokemon/data/model/pokemon_model.dart';
import 'package:agenda_pokemon/domain/usecase/pokemon_usecase.dart';
import 'package:flutter/foundation.dart';

class PokemonViewModel extends ChangeNotifier {
  PokemonUseCase _pokemonUseCase = PokemonUseCase();

  PokemonModel _pokemonModel;
  String _message;

  PokemonModel get getPokemon => _pokemonModel;
  String get getMessage => _message;

  retrievePokemon({@required String url}) async {
    final result = await _pokemonUseCase.retrievePokemon(url: url);

    if (result is PokemonModel) {
      _pokemonModel = result;
    } else {
      _message = result;
    }

    notifyListeners();
  }
}
