import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 201,
      width: 340,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListView.separated(
            itemBuilder: (context, index) => CachedNetworkImage(
              imageUrl: "https://www.teahub.io/photos/full/21-218810_beautiful-wallpapers-download-for-mobile-download-beautiful-images.jpg",
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 5),
            itemCount: 3,
          )
        ],
      ),
    );
  }
}
