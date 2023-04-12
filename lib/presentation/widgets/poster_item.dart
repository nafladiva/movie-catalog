import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/presentation/pages/pages.dart';

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
        onTap: () => Navigator.pushNamed(
          context,
          MovieDetailPage.routeName,
          arguments: movie?.id,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            width: 125,
            imageUrl: '${MyConsts.baseImageUrl}$posterPath',
          ),
        ),
      ),
    );
  }
}
