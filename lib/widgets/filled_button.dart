import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilledButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? color;

  const FilledButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  _FilledButtonState createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = context.watch<ThemeCubit>().state;
    final onTap = widget.onTap;
    final color = widget.color ??
        (isLight ? const Color(0xFFDEDA80) : const Color(0xFFD6D16A));
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTap != null
          ? (_) {
              _animationController.forward();
            }
          : null,
      onTapUp: onTap != null
          ? (_) {
              _animationController.reverse();
            }
          : null,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: onTap != null ? color : Colors.black38,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
