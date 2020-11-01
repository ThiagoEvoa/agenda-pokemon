import 'package:agenda_pokemon/data/model/pokebook_model.dart';
import 'package:agenda_pokemon/domain/entity/pokebook_resoults_entity.dart';
import 'package:agenda_pokemon/domain/usecase/pokebook_usecase.dart';
import 'package:flutter/foundation.dart';

class PokeBookViewModel extends ChangeNotifier {
  PokeBookUseCase _pokeBookUseCase = PokeBookUseCase();

  PokeBookModel _pokeBookResoultsEntity;
  List<PokeBookResoultsEntity> _pokemons;
  String _message;
  bool _hasMore;

  PokeBookModel get getPokeBookResoultsEntity => _pokeBookResoultsEntity;
  List<PokeBookResoultsEntity> get getPokemons => _pokemons;
  String get getMessage => _message;
  bool get getHasMore => _hasMore;

  retrievePokeBook({@required String url}) async {
    final result = await _pokeBookUseCase.retrievePokeBook(url: url);

    if (result is PokeBookModel) {
      _pokeBookResoultsEntity = result;
      if (result.next != null) {
        _hasMore = true;
        if (_pokemons == null) {
          _pokemons = result.results;
        } else {
          _pokemons += result.results;
        }
      } else {
        _hasMore = false;
      }
    } else {
      _message = result;
    }

    notifyListeners();
  }
}
