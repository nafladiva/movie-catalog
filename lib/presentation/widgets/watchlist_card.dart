import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({
    Key? key,
    required this.watchlist,
  }) : super(key: key);

  final WatchlistMdl watchlist;

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
              width: 70,
              imageUrl: '${MyConsts.baseImageUrl}${watchlist.posterPath}',
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  watchlist.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TStyles.subheading1(),
                ),
                const SizedBox(height: 7.0),
                MyBadge(
                  text: watchlist.id.startsWith('1') ? 'Movie' : 'TV Show',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
