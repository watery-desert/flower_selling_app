import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../cart_repository.dart';

class CartRepo {
  final fireStore = FirebaseFirestore.instance;

  Stream<List<Cart>> getCartData() {
    final collectionQuerySnapshot = fireStore.collection('cart').snapshots();

    final cart = collectionQuerySnapshot.map((querySnapshot) => querySnapshot
        .docs
        .map((queryDocSnapshot) =>
            Cart.fromMap(queryDocSnapshot.data(), queryDocSnapshot.id))
        .toList());

    return cart;
  }

  Future<bool> checkItemExist(String id) async {
    final docReference = fireStore.collection('cart').doc(id);

    final doc = await docReference.get();

    return doc.exists;
  }

  Future<bool> addToCart(Cart cart) async {
    final docReference = fireStore.collection('cart').doc(cart.id);
    try {
      await docReference.set(cart.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> deleteFromCart(String id) async {
    final docReference = fireStore.collection('cart').doc(id);
    await docReference.delete();
  }
}
