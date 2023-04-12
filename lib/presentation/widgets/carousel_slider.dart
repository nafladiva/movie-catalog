import 'package:flutter/material.dart';
import 'package:gowatch/data/models/models.dart';

import 'widgets.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({
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
            (movie) => Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CarouselItem(movie: movie),
            ),
          ),
        ],
      ),
    );
  }
}
