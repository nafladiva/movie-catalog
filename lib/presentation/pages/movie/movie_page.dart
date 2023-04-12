import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';

import 'views/now_playing_movie_view.dart';
import 'views/popular_movie_view.dart';
import 'views/top_rated_movie_view.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with AutomaticKeepAliveClientMixin {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = locator<MovieCubit>();
    movieCubit.getPopularMovies();
  }

  @override
  void dispose() {
    movieCubit.close();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello! 👋',
                        style: TStyles.heading1(),
                      ),
                      Text(
                        'What kinda movie you wanna go?',
                        style: TStyles.paragraph1(),
                      ),
                      const SizedBox(height: 20.0),
                      const NowPlayingMovieView(),
                      const SizedBox(height: 40.0),
                      const PopularMovieView(),
                      const SizedBox(height: 30.0),
                      const TopRatedMovieView(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
