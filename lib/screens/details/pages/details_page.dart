import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.pokemon, required this.list});
  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [DetailAppBarWidget(pokemon: pokemon)]),
    );
  }
}
