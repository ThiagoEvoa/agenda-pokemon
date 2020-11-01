import 'package:agenda_pokemon/presentation/viewmodel/pokemon_viewmodel.dart';
import 'package:agenda_pokemon/presentation/widget/header_pokemon.dart';
import 'package:agenda_pokemon/presentation/widget/loading_widget.dart';
import 'package:agenda_pokemon/presentation/widget/message_widget.dart';
import 'package:agenda_pokemon/presentation/widget/stats_pokemon.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Consumer<PokemonViewModel>(
        builder: (context, pokemonViewModel, child) {
          if (pokemonViewModel.getMessage != null) {
            return MessageWidget(message: pokemonViewModel.getMessage);
          } else if (pokemonViewModel.getPokemon == null) {
            return LoadingWidget();
          } else {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                HeaderPokemon(pokemonViewModel: pokemonViewModel),
                StatsPokemon(pokemonViewModel: pokemonViewModel),
              ],
            );
          }
        },
      ),
    );
  }
}
