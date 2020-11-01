import 'package:agenda_pokemon/domain/entity/item_move_entity.dart';
import 'package:agenda_pokemon/domain/entity/item_statistic_entity.dart';
import 'package:agenda_pokemon/domain/entity/sprite_entity.dart';
import 'package:agenda_pokemon/domain/entity/type_entity.dart';

class PokemonEntity {
  final String name;
  final int weight;
  final int height;
  final List<ItemMoveEntity> moves;
  final SpriteEntity sprite;
  final List<ItemStatisticEntity> stats;
  final List<TypeEntity> types;

  PokemonEntity(
      this.name,
      this.weight,
      this.height,
      this.moves,
      this.sprite,
      this.stats,
      this.types);
}
