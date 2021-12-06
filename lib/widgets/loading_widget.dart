import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = theme.colorScheme.secondary;
    final canvasColor = theme.canvasColor;
    return Material(
      color: canvasColor,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotWave(
          color: accentColor,
          size: 100,
        ),
      ),
    );
  }
}
