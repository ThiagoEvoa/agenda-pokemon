import 'package:agenda_pokemon/presentation/viewmodel/pokebook_viewmodel.dart';
import 'package:agenda_pokemon/presentation/viewmodel/pokemon_viewmodel.dart';
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
    _pokeBookViewModel.retrievePokeBook(
        url: 'https://pokeapi.co/api/v2/pokemon');
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
            return Center(
              child: Text(pokebookViewModel.getMessage),
            );
          } else if (pokebookViewModel.getPokemons == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              controller: _scrollController,
              itemCount: pokebookViewModel.getPokemons.length + 1,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                if (index < pokebookViewModel.getPokemons.length) {
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
                      captilizeFirstLetter(
                          word: pokebookViewModel.getPokemons[index].name),
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                } else if (pokebookViewModel.getHasMore) {
                  _pokeBookViewModel.retrievePokeBook(
                      url: pokebookViewModel.getPokeBookResoultsEntity.next);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        'Nothing more to load',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
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
