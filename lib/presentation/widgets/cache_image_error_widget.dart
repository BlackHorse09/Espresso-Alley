import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';

class CacheImageErrorWidget extends StatelessWidget {
  const CacheImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        SizedBox(height: 16),
        Text(AllStrings.somethingWentWrong)
      ],
    );
  }
}
