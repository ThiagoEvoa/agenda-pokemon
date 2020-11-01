import 'package:agenda_pokemon/data/model/pokebook_resoults_model.dart';
import 'package:agenda_pokemon/domain/entity/pokebook_entity.dart';

class PokeBookModel extends PokeBookEntity {
  PokeBookModel(
      {int count,
      String next,
      String previous,
      List<PokeBookResoultsModel> results})
      : super(count, next, previous, results);

  factory PokeBookModel.fromJson(Map<String, dynamic> json) {
    return PokeBookModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: PokeBookResoultsModel.convertToList(json['results']));
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results
    };
  }
}
