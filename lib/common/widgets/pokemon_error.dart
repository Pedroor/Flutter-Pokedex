import 'package:flutter/material.dart';

class PokemonError extends StatelessWidget {
  const PokemonError({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Center(child: Text(error ?? 'Não foi possível carregar os dados')));
  }
}
