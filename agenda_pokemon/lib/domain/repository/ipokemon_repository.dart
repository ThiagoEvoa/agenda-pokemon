import 'package:flutter/foundation.dart';

abstract class IPokemonRepository {
  retrievePokemon({@required String url});
}
