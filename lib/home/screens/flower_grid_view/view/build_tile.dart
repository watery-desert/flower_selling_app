import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';
import '../../flower_detail_screen/flower_detail_screen.dart';
import 'package:animations/animations.dart';

class BuildTile extends StatelessWidget {
  final Flower flower;
  const BuildTile({Key? key, required this.flower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canvasColor = Theme.of(context).canvasColor;
    return OpenContainer(
      // transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 600),
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      closedElevation: 0.0,
      closedColor: canvasColor,
      openShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      openBuilder: (context, action) => FlowerDetailScreen.route(context, flower),
      closedBuilder: (context, action) => Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: flower.name,
                  child: Image.network(
                    flower.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: Text(
                flower.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
