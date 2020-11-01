import 'package:agenda_pokemon/domain/entity/item_move_entity.dart';
import 'package:agenda_pokemon/domain/entity/move_entity.dart';

class ItemMoveModel extends ItemMoveEntity {
  ItemMoveModel({MoveEntity move}) : super(move);

  factory ItemMoveModel.fromJson(Map<String, dynamic> json) {
    return ItemMoveModel(
      move: json['moves'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'move': move};
  }

  static List<ItemMoveModel> convertToList(List<dynamic> jsonString) {
    var jsonObject = jsonString.cast<Map<String, dynamic>>();
    return jsonObject.map((value) => ItemMoveModel.fromJson(value)).toList();
  }
}
