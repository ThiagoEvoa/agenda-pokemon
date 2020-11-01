import 'package:agenda_pokemon/data/repository/pokemon_repository.dart';
import 'package:agenda_pokemon/domain/repository/ipokemon_repository.dart';
import 'package:flutter/foundation.dart';

class PokemonUseCase {
  IPokemonRepository _iPokemonRepository = PokemonRepository();

  retrievePokemon({@required String url}) {
    return _iPokemonRepository.retrievePokemon(url: url);
  }
}
