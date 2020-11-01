import 'package:agenda_pokemon/domain/entity/pokebook_resoults_entity.dart';

class PokeBookEntity {
  final int count;
  final String next;
  final String previous;
  List<PokeBookResoultsEntity> results;

  PokeBookEntity(this.count, this.next, this.previous, this.results);
}
