import 'package:agenda_pokemon/domain/entity/type_entity.dart';

class TypeModel extends TypeEntity {
  TypeModel({String name}) : super(name);

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json['type']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  static List<TypeModel> convertToList(List<dynamic> jsonString) {
    var jsonObject = jsonString.cast<Map<String, dynamic>>();
    return jsonObject
        .map((value) => TypeModel.fromJson(value))
        .toList();
  }
}
