import 'package:cart_repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../bloc/cart_bloc.dart';

class BuildTile extends StatelessWidget {
  final Cart cart;
  const BuildTile({Key? key, required this.cart}) : super(key: key);

  Widget _buildSwipeBackground(AnimationController controller) =>
      AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              alignment: Alignment.centerRight,
              color: controller.value > 0.4 ? Colors.red : Colors.grey[400],
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 1.4).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: const Interval(
                        0.35,
                        0.4,
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
            );
          });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = theme.colorScheme.secondary;
    final cardColor = theme.cardColor;
    return SwipeableTile.card(
      key: UniqueKey(),
      direction: SwipeDirection.endToStart,
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8.0,
      ),
      onSwiped: (_) {
        context.read<CartBloc>().add(
              RemoveItem(id: cart.id),
            );
      },
      horizontalPadding: 16,
      verticalPadding: 12,
      color: cardColor,
      backgroundBuilder: (_, __, progress) {
        return _buildSwipeBackground(progress);
      },
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: 100,
            height: 100,
            // margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              cart.imageLink,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '${cart.count * cart.price}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'x ${cart.count}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
