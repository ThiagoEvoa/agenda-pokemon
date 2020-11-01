import 'package:agenda_pokemon/presentation/viewmodel/pokemon_viewmodel.dart';
import 'package:agenda_pokemon/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String url;

  const DetailScreen({Key key, @required this.url}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PokemonViewModel _pokemonViewModel;

  @override
  void initState() {
    _pokemonViewModel = context.read<PokemonViewModel>();
    _pokemonViewModel.retrievePokemon(url: widget.url);
    super.initState();
  }

  _getTypeColor({String type}) {
    switch (type) {
      case 'bug':
        return Colors.greenAccent;
      case 'dark':
        return Colors.black;
      case 'dragon':
        return Colors.indigo[400];
      case 'eletric':
        return Colors.yellow;
      case 'fairy':
        return Colors.pink[100];
      case 'fighting':
        return Colors.brown[700];
      case 'fire':
        return Colors.red[900];
      case 'flying':
        return Colors.blue[200];
      case 'ghost':
        return Colors.indigo[800];
      case 'grass':
        return Colors.green;
      case 'ground':
        return Colors.yellow[300];
      case 'ice':
        return Colors.blue[100];
      case 'normal':
        return Colors.grey[300];
      case 'poison':
        return Colors.purple[900];
      case 'psychic':
        return Colors.pink[400];
      case 'rock':
        return Colors.yellow[800];
      case 'steel':
        return Colors.grey;
      case 'water':
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Consumer<PokemonViewModel>(
        builder: (context, pokemonViewModel, child) {
          if (pokemonViewModel.getMessage != null) {
            return Center(
              child: Text(pokemonViewModel.getMessage),
            );
          } else if (pokemonViewModel.getPokemon == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
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
                                  itemCount:
                                      pokemonViewModel.getPokemon.types.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Center(
                                        child: Container(
                                          height: 25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: _getTypeColor(
                                                type: pokemonViewModel
                                                    .getPokemon
                                                    .types[index]
                                                    .name),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Text(
                                              pokemonViewModel
                                                  .getPokemon.types[index].name,
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
                            child: SvgPicture.network(
                              '${pokemonViewModel.getPokemon.sprite.other}',
                              height: 200,
                              width: 200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 410,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 10),
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
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
