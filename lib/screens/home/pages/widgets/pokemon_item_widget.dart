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
      decoration: BoxDecoration(
        color: pokemon.baseColor!.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pokemon.name),
            Row(
              children: [
                Column(
                  children:
                      pokemon.type.map((e) => TypeWidget(name: e)).toList(),
                ),
                Flexible(child: Image.network(pokemon.image))
              ],
            )
          ],
        ),
      ),
    );
  }
}
