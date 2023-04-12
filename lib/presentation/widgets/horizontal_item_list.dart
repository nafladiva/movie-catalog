import 'package:flutter/material.dart';
import 'package:gowatch/data/models/models.dart';

import 'widgets.dart';

class HorizontalItemList extends StatelessWidget {
  const HorizontalItemList({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  final List<MovieMdl> movieList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...movieList.map(
            (item) => PosterItem.movie(movie: item),
          ),
        ],
      ),
    );
  }
}
