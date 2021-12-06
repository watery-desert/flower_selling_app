import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flowers_repository/flowers_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo _cartRepo;
  StreamSubscription? streamSubscription;
  CartBloc({
    required CartRepo cartRepo,
  })  : _cartRepo = cartRepo,
        super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<CartUpdated>(_onCartUpdated);
    on<RemoveItem>(_onRemoveItem);
  }

  _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    streamSubscription?.cancel();
    streamSubscription = _cartRepo.getCartData().listen((cartData) {
      add(CartUpdated(cartData));
    });
  }

  _onCartUpdated(CartUpdated event, Emitter<CartState> emit) {
    emit(CartLoaded(event.cartData));
  }

  _onRemoveItem(RemoveItem event, Emitter<CartState> emit) async {
    await _cartRepo.deleteFromCart(event.id);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
