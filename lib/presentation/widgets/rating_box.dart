import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({
    super.key,
    required this.voteAvg,
    this.voteCount,
  }) : isCompact = false;

  const RatingBox.compact({
    super.key,
    required this.voteAvg,
    this.voteCount,
  }) : isCompact = true;

  final double voteAvg;
  final int? voteCount;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          decoration: BoxDecoration(
            color: Themes.yellowColor.withOpacity(0.2),
            border: Border.all(color: Themes.yellowColor),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Themes.yellowColor,
                size: isCompact ? 16.0 : 20.0,
              ),
              Text(
                '${voteAvg.toStringAsFixed(1)} / 10',
                style: isCompact
                    ? TStyles.subheading2(color: Themes.yellowColor)
                    : TStyles.subheading1(color: Themes.yellowColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        if (voteCount != null) ...[
          Text(
            'Voted by $voteCount people',
            style: TStyles.paragraph3(),
          ),
        ],
      ],
    );
  }
}
