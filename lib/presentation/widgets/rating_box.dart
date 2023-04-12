import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({
    super.key,
    required this.voteAvg,
    required this.voteCount,
  });

  final double voteAvg;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          decoration: BoxDecoration(
            color: Themes.yellowColor.withOpacity(0.2),
            border: Border.all(
              color: Themes.yellowColor,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star,
                color: Themes.yellowColor,
              ),
              Text(
                '$voteAvg / 10',
                style: TStyles.subheading1(color: Themes.yellowColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Voted by $voteCount people',
          style: TStyles.paragraph3(),
        ),
      ],
    );
  }
}
