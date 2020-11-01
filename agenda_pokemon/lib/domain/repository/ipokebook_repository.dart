import 'package:flutter/foundation.dart';

abstract class IPokeBookRepository{
  retrievePokeBook({@required String url});
}