import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list}) : super(key: key);
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(list[index].name),
              );
            }));
  }
}
