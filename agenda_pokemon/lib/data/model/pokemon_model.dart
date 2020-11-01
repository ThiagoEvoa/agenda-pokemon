import 'package:agenda_pokemon/data/model/item_move_model.dart';
import 'package:agenda_pokemon/data/model/item_statistic_model.dart';
import 'package:agenda_pokemon/data/model/sprite_model.dart';
import 'package:agenda_pokemon/data/model/type_model.dart';
import 'package:agenda_pokemon/domain/entity/item_move_entity.dart';
import 'package:agenda_pokemon/domain/entity/item_statistic_entity.dart';
import 'package:agenda_pokemon/domain/entity/pokemon_entity.dart';
import 'package:agenda_pokemon/domain/entity/sprite_entity.dart';
import 'package:agenda_pokemon/domain/entity/type_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {String name,
      int weight,
      int height,
      List<ItemMoveEntity> moves,
      SpriteEntity sprite,
      List<ItemStatisticEntity> stats,
      List<TypeEntity> types})
      : super(name, weight, height, moves, sprite, stats, types);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        name: json['name'],
        weight: json['weight'],
        height: json['height'],
        moves: ItemMoveModel.convertToList(json['moves']),
        sprite: SpriteModel.fromJson(json['sprites']),
        stats: ItemStatisticModel.convertToList(json['stats']),
        types: TypeModel.convertToList(json['types']));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weight': weight,
      'height': height,
      'moves': moves,
      'sprite': sprite,
      'stats': stats,
      'types': types,
    };
  }
}
