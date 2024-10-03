import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageView extends StatelessWidget {
  final String image;
  final bool isNetwork;
  const FullScreenImageView(
      {super.key, required this.image, this.isNetwork = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllStrings.viewmage),
      ),
      body: PhotoView(
        imageProvider: isNetwork
            ? CachedNetworkImageProvider(image)
            : FileImage(File(image)),
      ),
    );
  }
}
