part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> data;
  const CartLoaded(this.data);

  @override
  List<Object> get props => [data];
}
