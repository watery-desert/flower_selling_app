import 'package:flutter/material.dart';

class TapButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TapButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
