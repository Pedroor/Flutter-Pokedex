import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    super.key,
    required this.pokemon,
  });
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(pokemon.name),
          Row(
            children: [
              Column(
                children: pokemon.type.map((e) => TypeWidget(name: e)).toList(),
              ),
              Image.network(pokemon.image)
            ],
          )
        ],
      ),
    );
  }
}
