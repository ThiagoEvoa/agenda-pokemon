import 'package:agenda_pokemon/presentation/ui/detail_screen.dart';
import 'package:agenda_pokemon/presentation/viewmodel/pokebook_viewmodel.dart';
import 'package:agenda_pokemon/util/string_util.dart';
import 'package:flutter/material.dart';

class ItemPokemonWidget extends StatelessWidget {
  final PokeBookViewModel pokebookViewModel;
  final int index;

  const ItemPokemonWidget(
      {Key key, @required this.pokebookViewModel, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              url: pokebookViewModel.getPokemons[index].url,
            ),
          ),
        );
      },
      leading: Container(
        child: Text('#$index'),
        alignment: Alignment.centerLeft,
        width: 60,
      ),
      title: Text(
        captilizeFirstLetter(word: pokebookViewModel.getPokemons[index].name),
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
