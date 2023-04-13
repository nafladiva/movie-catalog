import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class SeasonCard extends StatelessWidget {
  const SeasonCard({
    Key? key,
    required this.season,
  }) : super(key: key);

  final SeasonMdl season;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: CachedNetworkImage(
              width: 75,
              imageUrl: season.posterPath != null
                  ? '${MyConsts.baseImageUrl}${season.posterPath}'
                  : MyConsts.placeholderErrorImageUrl,
              placeholder: (context, url) =>
                  const BaseShimmerLoader(height: 107, width: 75),
            ),
          ),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                season.name ?? '',
                style: TStyles.subheading2(),
              ),
              Text(
                'Total episodes: ${season.episodeCount}',
                style: TStyles.paragraph2(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
