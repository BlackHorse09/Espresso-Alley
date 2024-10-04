import 'package:coffeeapp/presentation/widgets/retry_favourite_widget.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Column(
                            children: [
                              Text(AllStrings.noInternetConnection),
                              SizedBox(height: 16),
                              RetryFavouriteWidget()
                            ],
                          ),
                        ),
                      );
  }
}