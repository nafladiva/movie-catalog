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
    final backdropPath =
        movie != null ? movie?.backdropPath : tvShow?.backdropPath;
    final title = movie != null ? movie?.title : tvShow?.title;
    final voteAvg = movie != null ? movie?.voteAverage : tvShow?.voteAverage;

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
          Navigator.pushNamed(
            context,
            TVShowDetailPage.routeName,
            arguments: tvShow?.id,
          );
        }
      },
      child: Stack(
        children: [
          ClipRRect(
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
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Themes.defaultColor.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title ?? '',
                    style: TStyles.subheading1(),
                  ),
                  const SizedBox(height: 5.0),
                  RatingBox.compact(voteAvg: voteAvg ?? 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
