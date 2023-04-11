import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                width: 280,
                imageUrl:
                    '${MyConsts.baseImageUrl}/ytdebEE0ndYLSTEctPgh8e0vaBs.jpg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                width: 280,
                imageUrl:
                    '${MyConsts.baseImageUrl}/ytdebEE0ndYLSTEctPgh8e0vaBs.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
