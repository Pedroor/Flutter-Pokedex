import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/errors/failure.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/common/widgets/pokemon_error.dart';
import 'package:flutter_pokedex/common/widgets/pokemon_loading.dart';
import 'package:flutter_pokedex/screens/details/pages/details_page.dart';

class DetailsArguments {
  DetailsArguments({required this.pokemon, this.index = 0});
  final Pokemon pokemon;
  final int? index;
}

class DetailsContainer extends StatefulWidget {
  const DetailsContainer(
      {super.key,
      required this.repository,
      required this.arguments,
      required this.onBack});
  final IPokemonRepository repository;
  final DetailsArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: widget.repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return PokemonLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailsPage(
              pokemon: widget.arguments.pokemon,
              list: snapshot.data!,
              onBack: widget.onBack,
              controller: controller,
            );
          }

          if (snapshot.hasError) {
            return PokemonError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
