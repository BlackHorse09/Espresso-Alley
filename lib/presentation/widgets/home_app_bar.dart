import 'package:coffeeapp/presentation/screens/favourite_page.dart';
import 'package:flutter/material.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FavouritePage()));
        },
        icon: const Icon(
          Icons.star,
          color: Colors.yellow,
        ));
  }
}
