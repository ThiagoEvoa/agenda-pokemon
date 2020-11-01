import 'package:agenda_pokemon/domain/entity/pokebook_resoults_entity.dart';

class PokeBookResoultsModel extends PokeBookResoultsEntity {
  PokeBookResoultsModel({String name, String url})
      : super(name: name, url: url);

  factory PokeBookResoultsModel.fromJson(Map<String, dynamic> json) {
    return PokeBookResoultsModel(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }

  static List<PokeBookResoultsModel> convertToList(List<dynamic> jsonString) {
    var jsonObject = jsonString.cast<Map<String, dynamic>>();
    return jsonObject
        .map((value) => PokeBookResoultsModel.fromJson(value))
        .toList();
  }
}
