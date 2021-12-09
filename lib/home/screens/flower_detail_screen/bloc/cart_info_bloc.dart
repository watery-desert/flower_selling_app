import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flowers_repository/flowers_repository.dart';

part 'cart_info_event.dart';
part 'cart_info_state.dart';

class CartInfoBloc extends Bloc<CartInfoEvent, CartInfoState> {
  final CartRepo _cartRepo;
  StreamSubscription? streamSubscription;
  CartInfoBloc({
    required CartRepo cartRepo,
  })  : _cartRepo = cartRepo,
        super(CartInfoLoading()) {
    on<CheckFlowerInCart>(_onCheckFlowerInCart);
    // on<FlowerUpdated>(_onFlowerUpdated);
    on<UpdateCart>(_onUpdateCart);
  }

  // _onLoadFlowerDetail(
  //     CheckFlowerInCart event, Emitter<FlowerDetailState> emit) {
  //   streamSubscription?.cancel();
  //   _flowersRepo.getFlower(event.id).listen((flower) {
  //     add(FlowerUpdated(flower));
  //   });
  // }

  _onCheckFlowerInCart(
      CheckFlowerInCart event, Emitter<CartInfoState> emit) async {
    final isExist = await _cartRepo.checkItemExist(event.id);

    if (isExist) {
      emit(ItemIsExist());
    } else {
      emit(ItemNotExist());
    }
  }

  // _onFlowerUpdated(FlowerUpdated event, Emitter<FlowerDetailState> emit) {
  //   emit(FlowerDetailLoaded(event.flower));
  // }

  _onUpdateCart(UpdateCart event, Emitter<CartInfoState> emit) async {
    emit(CartInfoLoading());
    final succeeded = await _cartRepo.addToCart(event.cart);
    if (succeeded) {
      emit(ItemIsExist());
    } else {
      emit(ItemNotExist());
    }
  }

  // @override
  // Future<void> close() {
  //   streamSubscription?.cancel();
  //   return super.close();
  // }
}
