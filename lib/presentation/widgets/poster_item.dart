import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/presentation/pages/pages.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class PosterItem extends StatelessWidget {
  const PosterItem.movie({
    Key? key,
    required this.movie,
  })  : tvShow = null,
        super(key: key);

  const PosterItem.tvShow({
    Key? key,
    required this.tvShow,
  })  : movie = null,
        super(key: key);

  final MovieMdl? movie;
  final TVShowMdl? tvShow;

  @override
  Widget build(BuildContext context) {
    final posterPath = movie != null ? movie?.posterPath : tvShow?.posterPath;

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        onTap: () {
          if (movie != null) {
            Navigator.pushNamed(
              context,
              MovieDetailPage.routeName,
              arguments: movie?.id,
            );
          }

          if (tvShow != null) {
            Navigator.pushNamed(
              context,
              TVShowDetailPage.routeName,
              arguments: tvShow?.id,
            );
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            width: 125,
            imageUrl: posterPath != null
                ? '${MyConsts.baseImageUrl}$posterPath'
                : MyConsts.placeholderErrorImageUrl,
            placeholder: (context, url) =>
                const BaseShimmerLoader(height: 180, width: 125),
          ),
        ),
      ),
    );
  }
}
