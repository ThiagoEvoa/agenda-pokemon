import 'package:agenda_pokemon/data/model/stat_model.dart';
import 'package:agenda_pokemon/domain/entity/item_statistic_entity.dart';
import 'package:agenda_pokemon/domain/entity/stat_entity.dart';

class ItemStatisticModel extends ItemStatisticEntity {
  ItemStatisticModel({int baseStat, StatEntity stat}) : super(baseStat, stat);

  factory ItemStatisticModel.fromJson(Map<String, dynamic> json) {
    return ItemStatisticModel(
      baseStat: json['base_stat'],
      stat: StatModel.fromJson(json['stat']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'baseStat': baseStat, 'stat': stat};
  }

  static List<ItemStatisticModel> convertToList(List<dynamic> jsonString) {
    var jsonObject = jsonString.cast<Map<String, dynamic>>();
    return jsonObject
        .map((value) => ItemStatisticModel.fromJson(value))
        .toList();
  }
}
