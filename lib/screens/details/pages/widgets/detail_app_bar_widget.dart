import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    super.key,
    required this.onBack,
    required this.pokemon,
    required this.isOnTop,
  });
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SliverAppBar(
          pinned: true,
          elevation: 0,
          backgroundColor: pokemon.baseColor,
          leading: IconButton(
            onPressed: onBack,
            icon: Icon(Icons.chevron_left),
          ),
          centerTitle: false,
          title: AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: isOnTop ? 0 : 1,
            child: Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
