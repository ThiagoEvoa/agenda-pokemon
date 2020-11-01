import 'package:agenda_pokemon/data/datasource/pokemon_datasource.dart';
import 'package:agenda_pokemon/domain/repository/ipokemon_repository.dart';

class PokemonRepository implements IPokemonRepository {
  PokemonDataSource _pokemonDataSource = PokemonDataSource();

  @override
  retrievePokemon({String url}) {
    return _pokemonDataSource.retrievePokeBook(url: url);
  }
}
