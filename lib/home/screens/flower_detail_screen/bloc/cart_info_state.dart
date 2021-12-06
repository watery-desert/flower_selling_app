part of 'cart_info_bloc.dart';

abstract class CartInfoState extends Equatable {
  const CartInfoState();

  @override
  List<Object> get props => [];
}

class CartInfoLoading extends CartInfoState {}

class ItemNotExist extends CartInfoState {}

class CartInfoLoaded extends CartInfoState {
  final Flower flower;

  const CartInfoLoaded(this.flower);

  @override
  List<Object> get props => [flower];
}

class ItemIsExist extends CartInfoState {}
