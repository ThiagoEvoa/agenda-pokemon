import 'package:agenda_pokemon/domain/entity/sprite_entity.dart';

class SpriteModel extends SpriteEntity {
  SpriteModel({String other}) : super(other);

  factory SpriteModel.fromJson(Map<String, dynamic> json) {
    return SpriteModel(
      other: json['other']['dream_world']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'other': other};
  }
}
