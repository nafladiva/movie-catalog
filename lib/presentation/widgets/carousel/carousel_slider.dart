import 'package:flutter/material.dart';
import 'package:gowatch/data/models/models.dart';

import 'carousel_item.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider.movie({
    Key? key,
    required this.movieList,
  })  : tvShowList = null,
        super(key: key);

  const CarouselSlider.tvShow({
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
              (movie) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CarouselItem.movie(movie: movie),
              ),
            ),
          ],
          if (tvShowList != null) ...[
            ...tvShowList!.map(
              (tvShow) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CarouselItem.tvShow(tvShow: tvShow),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
