import 'package:agenda_pokemon/data/model/pokebook_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PokeBookDataSource {
  retrievePokeBook({@required String url}) async {
    try {
      final response = await Dio().get(url);
      return PokeBookModel.fromJson(response.data);
    } catch (exception) {
      return 'Unable to retrieve Pokemons';
    }
  }
}
