import 'package:coffeeapp/presentation/widgets/retry_favourite_widget.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AllStrings.somethingWentWrongImage,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            RetryFavouriteWidget(),
          ],
        ));
  }
}
