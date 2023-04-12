import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/presentation/pages/pages.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieMdl movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        MovieDetailPage.routeName,
        arguments: movie.id,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          width: 280,
          imageUrl: '${MyConsts.baseImageUrl}${movie.backdropPath}',
          placeholder: (context, url) =>
              const BaseShimmerLoader(height: 155, width: 280),
        ),
      ),
    );
  }
}
