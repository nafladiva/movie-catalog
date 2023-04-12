import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:gowatch/common/common.dart';

import '../widgets/widgets.dart';

class MovieDetailPage extends StatelessWidget {
  static const routeName = '/detail-movie';

  const MovieDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            minHeight: 300.0,
            maxHeight: 800.0,
            color: Themes.defaultColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20.0)),
            body: Column(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${MyConsts.baseImageUrl}/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
                ),
              ],
            ),
            panel: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Container(
                    width: 90,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Themes.primaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Spiderman: No Way Home',
                    style: TStyles.heading2(),
                  ),
                  const SizedBox(height: 10.0),
                  const MyBadge(),
                  const SizedBox(height: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rating',
                        style: TStyles.subheading2(),
                      ),
                      const SizedBox(height: 8.0),
                      const RatingBox(),
                      const SizedBox(height: 25.0),
                      Text(
                        'Release Date',
                        style: TStyles.subheading2(),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '2023-03-15',
                        style: TStyles.paragraph1(),
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        'Overview',
                        style: TStyles.subheading2(),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
                        style: TStyles.paragraph1(),
                      ),
                      const SizedBox(height: 40.0),
                      const DefaultButton()
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Themes.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
