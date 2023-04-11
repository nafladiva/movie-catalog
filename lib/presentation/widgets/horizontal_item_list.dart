import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';

class HorizontalItemList extends StatelessWidget {
  const HorizontalItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                width: 125,
                imageUrl:
                    '${MyConsts.baseImageUrl}/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                width: 125,
                imageUrl:
                    '${MyConsts.baseImageUrl}/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
