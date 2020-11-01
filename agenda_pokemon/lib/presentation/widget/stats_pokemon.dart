import 'package:agenda_pokemon/presentation/viewmodel/pokemon_viewmodel.dart';
import 'package:agenda_pokemon/util/string_util.dart';
import 'package:flutter/material.dart';

class StatsPokemon extends StatelessWidget {
  final PokemonViewModel pokemonViewModel;

  const StatsPokemon({Key key, @required this.pokemonViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 410,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Height: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '${pokemonViewModel.getPokemon.height}0 cm',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Weight: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '${pokemonViewModel.getPokemon.weight} kg',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: pokemonViewModel.getPokemon.stats.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${captilizeFirstLetter(word: pokemonViewModel.getPokemon.stats[index].stat.name)}:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 10,
                              thumbColor: Colors.transparent,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 0,
                              ),
                            ),
                            child: Slider(
                              onChanged: (value) {},
                              value: pokemonViewModel
                                  .getPokemon.stats[index].baseStat
                                  .toDouble(),
                              max: 230,
                              min: 0,
                            ),
                          ),
                        ),
                        Text(
                          '${pokemonViewModel.getPokemon.stats[index].baseStat}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
