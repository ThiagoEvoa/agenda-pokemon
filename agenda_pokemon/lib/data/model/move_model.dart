import 'package:agenda_pokemon/domain/entity/move_entity.dart';

class MoveModel extends MoveEntity {
  MoveModel({String name}) : super(name);

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
