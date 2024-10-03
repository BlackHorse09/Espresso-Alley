import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeapp/presentation/widgets/app_button.dart';
import 'package:coffeeapp/presentation/widgets/app_loader.dart';
import 'package:coffeeapp/presentation/widgets/cache_image_error_widget.dart';
import 'package:coffeeapp/presentation/widgets/view_image_icon_widget.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';

class ImageTwoButtons extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onSaveImagePressed;
  final VoidCallback onNextPressed;
  final bool isSaving;
  const ImageTwoButtons(
      {super.key,
      required this.imageUrl,
      required this.onNextPressed,
      required this.onSaveImagePressed,
      required this.isSaving});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: h * 0.5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    height: h * 0.5,
                    errorWidget: (context, url, error) =>
                        const CacheImageErrorWidget(),
                    placeholder: (context, url) => const AppLoaderWidget(),
                  ),
                  Positioned(
                      right: 4,
                      top: 4,
                      child: ViewImageIconWidget(image: imageUrl))
                ],
              )),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !isSaving
                ? AppButton(
                    onButtonPress: onSaveImagePressed,
                    label: AllStrings.saveImage)
                : const AppLoaderWidget(),
            AppButton(onButtonPress: onNextPressed, label: AllStrings.next)
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
