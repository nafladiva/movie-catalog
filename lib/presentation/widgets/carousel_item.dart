import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/presentation/pages/pages.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem.movie({
    Key? key,
    required this.movie,
  })  : tvShow = null,
        super(key: key);

  const CarouselItem.tvShow({
    Key? key,
    required this.tvShow,
  })  : movie = null,
        super(key: key);

  final MovieMdl? movie;
  final TVShowMdl? tvShow;

  @override
  Widget build(BuildContext context) {
    //TODO: fix layout (add title on top of backdrop)
    final backdropPath =
        movie != null ? movie?.backdropPath : tvShow?.backdropPath;

    return InkWell(
      onTap: () {
        if (movie != null) {
          Navigator.pushNamed(
            context,
            MovieDetailPage.routeName,
            arguments: movie?.id,
          );
        }

        if (tvShow != null) {
          //TODO: navigate to tv show detail page
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          width: 280,
          imageUrl: backdropPath != null
              ? '${MyConsts.baseImageUrl}$backdropPath'
              : MyConsts.placeholderErrorImageUrl,
          placeholder: (context, url) =>
              const BaseShimmerLoader(height: 155, width: 280),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
