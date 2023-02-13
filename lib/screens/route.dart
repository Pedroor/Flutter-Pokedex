import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/screens/details/container/details_container.dart';
import 'package:flutter_pokedex/screens/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({super.key, required this.repository});
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository,
              onItemTap: (route, arguments) {
                Navigator.of(context).pushNamed(route, arguments: arguments);
              },
            );
          });
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailsContainer(
              repository: repository,
              arguments: (settings.arguments as DetailsArguments),
              onBack: () => Navigator.of(context).pop(),
            );
          });
        }
      },
    );
  }
}
