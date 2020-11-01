import 'package:flutter/foundation.dart';

String captilizeFirstLetter({@required String word}) {
  var capitalizedWord = removeSeparator(word: word)
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');

  return capitalizedWord;
}

String removeSeparator({@required String word}) {
  return word.replaceAll('-', ' ');
}
