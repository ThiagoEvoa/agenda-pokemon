import 'package:agenda_pokemon/data/model/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PokemonDataSource {
  retrievePokeBook({@required String url}) async {
    try {
      final response = await Dio().get(url);
      return PokemonModel.fromJson(response.data);
    } catch (exception) {
      return 'Unable to retrieve Pokemon';
    }
  }
}
