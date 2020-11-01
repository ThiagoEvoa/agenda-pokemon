import 'package:flutter/material.dart';

getTypeColor({String type}) {
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
