import 'package:agenda_pokemon/presentation/viewmodel/pokebook_viewmodel.dart';
import 'package:agenda_pokemon/presentation/widget/item_pokemon_widget.dart';
import 'package:agenda_pokemon/presentation/widget/loading_widget.dart';
import 'package:agenda_pokemon/presentation/widget/message_widget.dart';
import 'package:agenda_pokemon/util/constants.dart';
import 'package:agenda_pokemon/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PokeBookViewModel _pokeBookViewModel;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _pokeBookViewModel = context.read<PokeBookViewModel>();
    _pokeBookViewModel.retrievePokeBook(url: POKEMON_URL);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Pokedex'),
      ),
      body: Consumer<PokeBookViewModel>(
        builder: (context, pokebookViewModel, child) {
          if (pokebookViewModel.getMessage != null) {
            return MessageWidget(message: pokebookViewModel.getMessage);
          } else if (pokebookViewModel.getPokemons == null) {
            return LoadingWidget();
          } else {
            return ListView.separated(
              controller: _scrollController,
              itemCount: pokebookViewModel.getPokemons.length + 1,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                if (index < pokebookViewModel.getPokemons.length) {
                  return ItemPokemonWidget(
                    pokebookViewModel: pokebookViewModel,
                    index: index,
                  );
                } else if (pokebookViewModel.getHasMore) {
                  _pokeBookViewModel.retrievePokeBook(
                      url: pokebookViewModel.getPokeBookResoultsEntity.next);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: LoadingWidget(),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: MessageWidget(message: 'Nothing more to load'),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}