import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/data/models/movie_mdl.dart';

import '../../common/common.dart';

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
            (item) => Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  width: 125,
                  imageUrl: '${MyConsts.baseImageUrl}${item.posterPath}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
