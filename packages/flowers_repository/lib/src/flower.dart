import 'package:equatable/equatable.dart';

class Flower extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageLink;
  final double price;
  final int count;
  final bool addedToCart;

  const Flower({
    required this.id,
    required this.name,
    required this.description,
    required this.imageLink,
    required this.price,
    required this.count,
    required this.addedToCart,
  });

  factory Flower.fromMap(Map<String, dynamic> data, String id) {
    return Flower(
      id: id,
      name: data['name'],
      description: data['description'],
      imageLink: data['imageLink'],
      price: data['price'],
      count: data['count'],
      addedToCart: data['addedToCart'],
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "imageLink": imageLink,
        "price": price,
        "count": count,
        "addedToCart": addedToCart,
      };

  Flower copyWith({
    String? id,
    String? name,
    String? description,
    String? imageLink,
    double? price,
    int? count,
    bool? addedToCart,
  }) =>
      Flower(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        imageLink: imageLink ?? this.imageLink,
        price: price ?? this.price,
        count: count ?? this.count,
        addedToCart: addedToCart ?? this.addedToCart,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageLink,
        price,
        count,
        addedToCart,
      ];
}