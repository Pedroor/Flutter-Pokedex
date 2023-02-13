import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:flutter_pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {super.key,
      required this.pokemon,
      required this.onBack,
      required this.list,
      required this.controller});
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailListWidget(
            pokemon: pokemon,
            list: list,
            controller: controller,
          )
        ],
      ),
    );
  }
}
