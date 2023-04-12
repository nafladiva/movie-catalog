import 'package:flutter/material.dart';
import 'package:gowatch/data/models/models.dart';

import 'widgets.dart';

class HorizontalItemList extends StatelessWidget {
  const HorizontalItemList.movie({
    Key? key,
    required this.movieList,
  })  : tvShowList = null,
        super(key: key);

  const HorizontalItemList.tvShow({
    Key? key,
    required this.tvShowList,
  })  : movieList = null,
        super(key: key);

  final List<MovieMdl>? movieList;
  final List<TVShowMdl>? tvShowList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if (movieList != null) ...[
            ...movieList!.map(
              (item) => PosterItem.movie(movie: item),
            ),
          ],
          if (tvShowList != null) ...[
            ...tvShowList!.map(
              (item) => PosterItem.tvShow(tvShow: item),
            ),
          ],
        ],
      ),
    );
  }
}
