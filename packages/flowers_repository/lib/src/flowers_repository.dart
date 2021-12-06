import 'package:cloud_firestore/cloud_firestore.dart';

import '../flowers_repository.dart';

class FlowersRepo {
  final fireStore = FirebaseFirestore.instance;

  Future<void> uploadAllFlowersData() async {
    for (var data in _rawFlowersData) {
      await fireStore.collection('flowers').add(data);
    }
  }

  Stream<List<Flower>> getFlowers() {
    final collectionQuerySnapshot = fireStore.collection('flowers').snapshots();

    final flowerList = collectionQuerySnapshot.map((querySnapshot) =>
        querySnapshot.docs
            .map((queryDocSnapshot) =>
                Flower.fromMap(queryDocSnapshot.data(), queryDocSnapshot.id))
            .toList());

    return flowerList;
  }


  Future<void> updateFlower(Flower flower) async {
    final docReference = fireStore.collection('flowers').doc(flower.id);
    await docReference.update(flower.toMap());
  }
}

final _rawFlowersData = [
  {
    'name': 'Dahlias',
    'description':
        'These bold blooms come in a wide range of color and can be easily incorporated into any existing or new garden. And unlike most plants, these flowers thrive in some shade.',
    'imageLink':
        'https://images.unsplash.com/photo-1603507311949-07c0aeee4fe7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 18.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Lilies',
    'description':
        'Lilies are one of the most popular and versatile flowers in the world. Coming in a variety of colors and known for their strong fragrance,  In fact, lilies are one of the most popular flowers in the world, and it’s not hard to see why. There are over 100 different types of true lilies belonging to the “lilium” genus.',
    'imageLink':
        'https://images.unsplash.com/photo-1519064438923-de4de326dfd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 11.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Marigold',
    'description':
        'Beautifully orange and gold in color, marigolds are known to symbolize a desire for wealth and success. They are such a bright color that their pigments are also used in the textile and food industry!',
    'imageLink':
        'https://images.unsplash.com/photo-1606432144664-594a97fea6e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 12.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Petunia',
    'description':
        'The cheerful petunia, a staple of old-fashioned gardens, planters, and hanging pots, is more vivid than ever with red, yellow, pink, purple, lavender, white, multicolored, or striped blossoms. ',
    'imageLink':
        'https://images.unsplash.com/photo-1629727821209-5f8a9e474ed8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 15.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Sunflowers',
    'description':
        'Sunflowers are one of the most popular flower types and are best known for their dazzling yellow color and large size.',
    'imageLink':
        'https://images.unsplash.com/photo-1563305641-806e131a4262?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 10.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Rose',
    'description':
        'Many roses have a strong, pleasant scent. Most roses have prickles. They have many colour varieties red, pink yellow etc',
    'imageLink':
        'https://images.unsplash.com/photo-1597826368522-9f4cb5a6ba48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 14.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Tulip',
    'description':
        'Tulips (Tulipa) are a genus of spring-blooming perennial herbaceous bulbiferous geophytes (having bulbs as storage organs). The flowers are usually large, showy and brightly colored, generally red, pink, yellow, or white (usually in warm colors).',
    'imageLink':
        'https://images.unsplash.com/photo-1524386416438-98b9b2d4b433?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 13.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Jasmine',
    'description':
        'Fragrant-flowered Jasmine has small white flowers, although some species have bright yellow,',
    'imageLink':
        'https://images.unsplash.com/photo-1624396593468-0230b5c9c29e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 18.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Ixora',
    'description':
        'The large flower clusters come in red, orange, yellow and pink, and it\'s also known as jungle flame and flame of the woods.',
    'imageLink':
        'https://images.unsplash.com/photo-1635728390918-cdb91f2c128e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 17.99,
    'count': 1,
    'addedToCart': false,
  },
  {
    'name': 'Lavender',
    'description':
        'The flowers are lilac or blue in color. Lavender is most commonly used in aromatherapy. The fragrance from the oils of the lavender plant is believed to help promote calmness and wellness.',
    'imageLink':
        'https://images.unsplash.com/photo-1528756514091-dee5ecaa3278?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    'price': 16.99,
    'count': 1,
    'addedToCart': false,
  },
];
