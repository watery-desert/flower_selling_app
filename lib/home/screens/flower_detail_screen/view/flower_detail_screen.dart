import 'package:cart_repository/cart_repository.dart';
import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_info_bloc.dart';
import 'build_body.dart';
import 'build_header.dart';



class FlowerDetailScreen extends StatelessWidget {
  final Flower _flower;
  const FlowerDetailScreen._(Key? key, this._flower) : super(key: key);

  static Widget route(BuildContext context, Flower flower, {Key? key}) {
    return BlocProvider<CartInfoBloc>(
      create: (context) => CartInfoBloc(
        cartRepo: context.read<CartRepo>(),
      )..add(CheckFlowerInCart(flower.id)),
      child: FlowerDetailScreen._(key, flower),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildHeader(flower: _flower),
          Expanded(
            child: BuildBody(
              flower: _flower,
            ),
          ),
        ],
      ),
    );
  }
}
