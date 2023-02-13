import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppBar(
          elevation: 0,
          backgroundColor: pokemon.baseColor,
        ));
  }
}
