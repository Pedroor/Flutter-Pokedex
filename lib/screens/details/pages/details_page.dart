import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.name, required this.list});
  final String name;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 400,
              child: PageView(
                children: list.map((e) => Text(e.name)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
