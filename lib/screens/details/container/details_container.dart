import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/errors/failure.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/common/widgets/pokemon_error.dart';
import 'package:flutter_pokedex/common/widgets/pokemon_loading.dart';
import 'package:flutter_pokedex/screens/details/pages/details_page.dart';

class DetailsArguments {
  DetailsArguments({required this.pokemon});
  final Pokemon pokemon;
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer(
      {super.key, required this.repository, required this.arguments});
  final IPokemonRepository repository;
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return PokemonLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailsPage(
                pokemon: arguments.pokemon, list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return PokemonError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
