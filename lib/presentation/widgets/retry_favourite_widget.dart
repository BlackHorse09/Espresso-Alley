import 'package:coffeeapp/coffee_image_bloc/coffee_image_bloc.dart';
import 'package:coffeeapp/coffee_image_bloc/coffee_image_event.dart';
import 'package:coffeeapp/presentation/screens/favourite_page.dart';
import 'package:coffeeapp/presentation/widgets/app_button.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RetryFavouriteWidget extends StatelessWidget {
  const RetryFavouriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
            onButtonPress: () {
              context.read<CoffeeImageBloc>().add(CoffeeImageFetchImageData());
            },
            label: AllStrings.retry),
        AppButton(
            onButtonPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouritePage()));
            },
            label: AllStrings.favouriteImages),
      ],
    );
  }
}
