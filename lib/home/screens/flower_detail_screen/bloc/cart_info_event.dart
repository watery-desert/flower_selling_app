part of 'cart_info_bloc.dart';

abstract class CartInfoEvent extends Equatable {
  const CartInfoEvent();

  @override
  List<Object> get props => [];
}

class CheckFlowerInCart extends CartInfoEvent {
  final String id;
  const CheckFlowerInCart(this.id);

  @override
  List<Object> get props => [id];
}


// class FlowerUpdated extends FlowerDetailEvent {
//   final Flower flower;
//   const FlowerUpdated(this.flower);

//   @override
//   List<Object> get props => [flower];
// }

class UpdateCart extends CartInfoEvent {
  final Cart cart;
  const UpdateCart(this.cart);

  @override
  List<Object> get props => [cart];
}