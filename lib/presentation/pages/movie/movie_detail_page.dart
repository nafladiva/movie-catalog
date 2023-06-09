import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';
import 'package:gowatch/common/common.dart';

class MovieDetailPage extends StatefulWidget {
  static const routeName = '/detail-movie';

  const MovieDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late MovieCubit movieCubit;
  late WatchlistCubit watchlistCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = locator<MovieCubit>();
    movieCubit.getMovieDetail(widget.id);

    watchlistCubit = locator<WatchlistCubit>();
    watchlistCubit.checkWatchlistStatus('1_${widget.id}');
  }

  @override
  void dispose() {
    movieCubit.close();
    watchlistCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state.movieResult?.isNotEmpty ?? false) {
            final movie = state.movieResult?[0];

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
                              '${MyConsts.baseImageUrl}${movie?.posterPath}',
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
                            movie?.title ?? '',
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
                                  ...(movie?.genres ?? []).map(
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
                                voteAvg: movie?.voteAverage ?? 0,
                                voteCount: movie?.voteCount ?? 0,
                              ),
                              const SizedBox(height: 25.0),
                              Text(
                                'Release Date',
                                style: TStyles.subheading2(),
                              ),
                              const SizedBox(height: 8.0),
                              //TODO: fix release date format
                              Text(
                                movie?.releaseDate?.toIso8601String() ?? '',
                                style: TStyles.paragraph1(),
                              ),
                              const SizedBox(height: 25.0),
                              Text(
                                'Overview',
                                style: TStyles.subheading2(),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                movie?.overview ?? '',
                                style: TStyles.paragraph1(),
                              ),
                              const SizedBox(height: 40.0),
                              BlocBuilder<WatchlistCubit, WatchlistState>(
                                bloc: watchlistCubit,
                                builder: (context, state) {
                                  final isInWatchlist = state.isInWatchlist;
                                  final watchlistId = '1_${movie?.id}';

                                  if (state.state?.isError ?? false) {
                                    return const SizedBox();
                                  }

                                  return DefaultButton(
                                    text: isInWatchlist
                                        ? 'Remove from watchlist'
                                        : 'Add to watchlist',
                                    icon:
                                        isInWatchlist ? Icons.close : Icons.add,
                                    onTap: () {
                                      if (isInWatchlist) {
                                        movieCubit
                                            .removeFromWatchlist(watchlistId);
                                      } else {
                                        movieCubit.addToWatchlist(
                                          WatchlistMdl(
                                            id: watchlistId,
                                            title: movie?.title ?? '',
                                            posterPath: movie?.posterPath,
                                            addedTimeStamp: DateTime.now(),
                                          ),
                                        );
                                      }

                                      watchlistCubit
                                          .checkWatchlistStatus(watchlistId);
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const AppBarBackButton(),
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
