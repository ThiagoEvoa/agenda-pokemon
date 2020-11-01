import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonWidget extends StatelessWidget {
  final String url;

  const PokemonWidget({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url == null
        ? FlutterLogo(
            size: 200,
          )
        : SvgPicture.network(
            url,
            height: 200,
            width: 200,
          );
  }
}
