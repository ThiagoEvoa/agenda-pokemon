import 'package:agenda_pokemon/presentation/viewmodel/pokemon_viewmodel.dart';
import 'package:agenda_pokemon/presentation/widget/pokemon_widget.dart';
import 'package:agenda_pokemon/util/color_util.dart';
import 'package:agenda_pokemon/util/string_util.dart';
import 'package:flutter/material.dart';

class HeaderPokemon extends StatelessWidget {
  final PokemonViewModel pokemonViewModel;

  const HeaderPokemon({Key key, @required this.pokemonViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    captilizeFirstLetter(
                        word: pokemonViewModel.getPokemon.name),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: pokemonViewModel.getPokemon.types.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Center(
                            child: Container(
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: getTypeColor(
                                    type: pokemonViewModel
                                        .getPokemon.types[index].name),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  pokemonViewModel.getPokemon.types[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: PokemonWidget(
                    url: pokemonViewModel.getPokemon.sprite.other),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
