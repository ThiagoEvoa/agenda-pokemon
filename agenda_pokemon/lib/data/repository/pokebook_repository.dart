import 'package:agenda_pokemon/data/datasource/pokebook_datasource.dart';
import 'package:agenda_pokemon/domain/repository/ipokebook_repository.dart';

class PokeBookRepository implements IPokeBookRepository {
  PokeBookDataSource _pokeBookDataSource = PokeBookDataSource();

  @override
  retrievePokeBook({String url}) {
    return _pokeBookDataSource.retrievePokeBook(url: url);
  }
}
