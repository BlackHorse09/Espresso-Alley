import 'package:coffeeapp/presentation/screens/full_screen_image_view.dart';
import 'package:flutter/material.dart';

class ViewImageIconWidget extends StatelessWidget {
  final String image;
  final bool isNetwork;
  const ViewImageIconWidget({super.key, required this.image, this.isNetwork = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FullScreenImageView(image: image, isNetwork: isNetwork)));
      },
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
