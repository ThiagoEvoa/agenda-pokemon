import 'package:agenda_pokemon/domain/entity/stat_entity.dart';

class StatModel extends StatEntity {
  StatModel({String name}) : super(name);

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  static List<StatModel> convertToList(Map<String, dynamic> jsonString) {
    return jsonString.entries.map((e) => StatModel(name: e.value)).toList();
  }  
}
