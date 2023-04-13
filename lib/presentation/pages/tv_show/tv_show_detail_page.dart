import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';
import 'package:gowatch/common/common.dart';

class TVShowDetailPage extends StatefulWidget {
  static const routeName = '/detail-tv-show';

  const TVShowDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<TVShowDetailPage> createState() => _TVShowDetailPageState();
}

class _TVShowDetailPageState extends State<TVShowDetailPage> {
  late TVShowCubit tvShowCubit;

  @override
  void initState() {
    super.initState();
    tvShowCubit = locator<TVShowCubit>();
    tvShowCubit.getTVShowDetail(widget.id);
  }

  @override
  void dispose() {
    tvShowCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: tvShowCubit,
      child: BlocBuilder<TVShowCubit, TVShowState>(
        builder: (context, state) {
          if (state.tvShowResult?.isNotEmpty ?? false) {
            final tvShow = state.tvShowResult?[0];

            return Scaffold(
              body: Stack(
                children: [
                  SlidingUpPanel(
                    minHeight: 300.0,
                    maxHeight: 800.0,
                    color: Themes.defaultColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20.0)),
                    // header: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Center(
                    //       child: Container(
                    //         margin: const EdgeInsets.only(top: 24.0),
                    //         width: 90,
                    //         height: 5,
                    //         decoration: BoxDecoration(
                    //           color: Themes.primaryColor.withOpacity(0.7),
                    //           borderRadius: BorderRadius.circular(20.0),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    body: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              '${MyConsts.baseImageUrl}${tvShow?.posterPath}',
                        ),
                      ],
                    ),
                    panel: Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 24.0),
                              width: 90,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Themes.primaryColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            Text(
                              tvShow?.title ?? '',
                              style: TStyles.heading2(),
                            ),
                            const SizedBox(height: 15.0),
                            Divider(
                              color: Themes.primaryColor.withOpacity(0.2),
                              thickness: 2.0,
                            ),
                            const SizedBox(height: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Genres',
                                  style: TStyles.subheading2(),
                                ),
                                const SizedBox(height: 8.0),
                                Wrap(
                                  runSpacing: 8.0,
                                  children: [
                                    ...(tvShow?.genres ?? []).map(
                                      (genre) => MyBadge(
                                        text: genre.name ?? '',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25.0),
                                Text(
                                  'Rating',
                                  style: TStyles.subheading2(),
                                ),
                                const SizedBox(height: 8.0),
                                RatingBox(
                                  voteAvg: tvShow?.voteAverage ?? 0,
                                  voteCount: tvShow?.voteCount ?? 0,
                                ),
                                const SizedBox(height: 25.0),
                                Text(
                                  'Overview',
                                  style: TStyles.subheading2(),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  tvShow?.overview ?? '',
                                  style: TStyles.paragraph1(),
                                ),
                                const SizedBox(height: 25.0),
                                Text(
                                  'Seasons',
                                  style: TStyles.subheading2(),
                                ),
                                const SizedBox(height: 8.0),
                                ...(tvShow?.seasons ?? []).map(
                                  (item) => SeasonCard(season: item),
                                ),
                                const SizedBox(height: 30.0),
                                DefaultButton(
                                  text: 'Add to watchlist',
                                  onTap: () {
                                    //TODO: checking watchlist status
                                    tvShowCubit.addToWatchlist(
                                      WatchlistMdl(
                                        id: '2_${tvShow?.id}',
                                        title: tvShow?.title ?? '',
                                        posterPath: tvShow?.posterPath,
                                        addedTimeStamp: DateTime.now(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 50.0),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20),
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

          return const DetailPageLoader();
        },
      ),
    );
  }
}
