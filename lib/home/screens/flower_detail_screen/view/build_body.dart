import 'package:cart_repository/cart_repository.dart';
import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/filled_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/flush_bar.dart';
import '../../../../theme/theme.dart';
import '../bloc/cart_info_bloc.dart';

class BuildBody extends StatefulWidget {
  final Flower flower;
  const BuildBody({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  late int count;
  late double price;

  String getPrice() {
    final value = (count * price).toStringAsFixed(2);
    return "\$ $value";
  }

  @override
  void initState() {
    super.initState();
    count = widget.flower.count;
    price = widget.flower.price;
  }

  Widget _heading(String text) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;
    final isLight = context.watch<ThemeCubit>().state;
    return Column(
      children: [
        _heading("About"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Text(
            widget.flower.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _heading("Total Count:"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    if (widget.flower.addedToCart) {
                      showMessage(
                          context: context,
                          icon: Icons.check_circle_outline_outlined,
                          code: "Already added",
                          message:
                              "You can't change now, remove it from cart.");
                    } else {
                      setState(() {
                        count = index + 1;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    // padding: const EdgeInsets.all(16),
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: count == index + 1
                          ? accentColor
                          : (isLight
                              ? Colors.black.withOpacity(0.1)
                              : Colors.white.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: count == index + 1 ? Colors.white : null,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  getPrice(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: BlocBuilder<CartInfoBloc, CartInfoState>(
                    builder: (context, state) {
                      final isLoading = state is CartInfoLoading;
                      final isExist = state is ItemIsExist;

                      return FilledButton(
                        color: isExist ? const Color(0xFF6ED478) : null,
                        title: isExist ? "Added to Cart" : "Add To Cart",
                        onTap: isLoading
                            ? null
                            : () {
                                if (isExist) {
                                  showMessage(
                                      context: context,
                                      icon: Icons.check_circle_outline_outlined,
                                      code: "Already added",
                                      message:
                                          "Please check out from your cart.");
                                } else {
                                  final flower = widget.flower;
                                  final cart = Cart(
                                    id: flower.id,
                                    imageLink: flower.imageLink,
                                    name: flower.name,
                                    price: flower.price,
                                    count: count,
                                  );

                                  context.read<CartInfoBloc>().add(
                                        UpdateCart(cart),
                                      );
                                }
                              },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
