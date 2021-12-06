part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class CartUpdated extends CartEvent {
  final List<Cart> cartData;
  const CartUpdated(this.cartData);

  @override
  List<Object> get props => [cartData];
}

class RemoveItem extends CartEvent {
  final String id;

  const RemoveItem({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
