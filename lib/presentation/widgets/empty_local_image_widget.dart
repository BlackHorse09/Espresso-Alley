import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';

class EmptyLocalImageWidget extends StatelessWidget {
  const EmptyLocalImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          AllStrings.emptyLocalImage,
          style: TextStyle(fontSize: 21, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
