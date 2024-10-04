import 'dart:io';
import 'package:coffeeapp/presentation/widgets/view_image_icon_widget.dart';
import 'package:flutter/material.dart';

class LocalImagesListWidget extends StatelessWidget {
  final String filePath;
  final VoidCallback onDeletePressed;
  const LocalImagesListWidget(
      {super.key, required this.filePath, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(File(filePath))),
              Positioned(
                  top: 4,
                  left: 4,
                  child: GestureDetector(
                    onTap: onDeletePressed,
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.delete_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )),
              Positioned(
                top: 4,
                right: 4,
                child: ViewImageIconWidget(image: filePath, isNetwork: false)
              )
            ],
          ),
        ),
      ],
    );
  }
}
