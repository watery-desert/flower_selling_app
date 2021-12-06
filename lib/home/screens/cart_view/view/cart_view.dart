import 'package:cart_repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../bloc/cart_bloc.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/filled_button.dart';
import 'build_tile.dart';

class CartView extends StatelessWidget {
  const CartView._(Key? key) : super(key: key);

  static Widget show(BuildContext context, {Key? key}) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(
        cartRepo: context.read<CartRepo>(),
      )..add(LoadCart()),
      child: CartView._(key),
    );
  }

  String _getTotal(List<Cart> items) {
    final double total =
        items.fold(0, (total, next) => total + (next.count * next.price));

    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const LoadingWidget();
        } else if (state is CartLoaded) {
          final List<Cart> cartItems = state.data;
          if (cartItems.isEmpty) {
            return const Center(
              child: Text(
                "Empty cart",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return AnimationLimiter(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: \$ ${_getTotal(cartItems)}",
                          style: TextStyle(
                            color: accentColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: FilledButton(
                            title: "Check Out",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...cartItems.map(
                    (item) => AnimationConfiguration.staggeredList(
                      duration: const Duration(milliseconds: 800),
                      position: cartItems.indexOf(item),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: BuildTile(
                            cart: item,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
