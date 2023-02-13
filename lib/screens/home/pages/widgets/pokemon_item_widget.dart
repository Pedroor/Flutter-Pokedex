import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/screens/details/container/details_container.dart';
import 'package:flutter_pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget(
      {super.key,
      required this.pokemon,
      required this.onTap,
      required this.index});
  final Pokemon pokemon;
  final Function(String, DetailsArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          onTap('/details', DetailsArguments(pokemon: pokemon, index: index)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemon.baseColor!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Text('#${pokemon.num}',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((e) => TypeWidget(name: e))
                            .toList(),
                      ),
                      Flexible(
                          child: Container(
                        height: 105,
                        width: 105,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(bottom: 12, right: 2, child: Image.network(pokemon.image))
        ],
      ),
    );
  }
}
