import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/screens/home/container/home_container.dart';
import 'package:flutter_pokedex/screens/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedexx',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
        home: PokedexRoute(repository: PokemonRepository(dio: Dio()))
    );
  }
}


