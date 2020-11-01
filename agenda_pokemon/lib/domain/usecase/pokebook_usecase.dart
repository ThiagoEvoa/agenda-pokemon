import 'package:agenda_pokemon/data/repository/pokebook_repository.dart';
import 'package:agenda_pokemon/domain/repository/ipokebook_repository.dart';
import 'package:flutter/foundation.dart';

class PokeBookUseCase {
  IPokeBookRepository _iPokeBookRepository = PokeBookRepository();

  retrievePokeBook({@required String url}) {
    return _iPokeBookRepository.retrievePokeBook(url: url);
  }
}
