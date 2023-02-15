import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:flutter_pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
    required this.pokemon,
    required this.onBack,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  });
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 37) {
              isOnTop = false;
            }
            if (scrollController.position.pixels <= 36) {
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              onBack: widget.onBack,
              pokemon: widget.pokemon,
              isOnTop: isOnTop,
            ),
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Container(
                    color: widget.pokemon.baseColor,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
