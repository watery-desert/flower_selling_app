import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final String id;
  final String name;
  final String imageLink;
  final double price;
  final int count;

  const Cart({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.price,
    required this.count,
  });

  factory Cart.fromMap(Map<String, dynamic> data, String id) {
    return Cart(
      id: id,
      name: data['name'],
      imageLink: data['imageLink'],
      price: data['price'],
      count: data['count'],
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "imageLink": imageLink,
        "price": price,
        "count": count,
      };

  Cart copyWith({
    String? id,
    String? name,
    String? imageLink,
    double? price,
    int? count,
  }) =>
      Cart(
        id: id ?? this.id,
        name: name ?? this.name,
        imageLink: imageLink ?? this.imageLink,
        price: price ?? this.price,
        count: count ?? this.count,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        imageLink,
        price,
        count,
      ];
}
