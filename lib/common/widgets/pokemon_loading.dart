import 'package:flutter/material.dart';

class PokemonLoading extends StatelessWidget {
  const PokemonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
