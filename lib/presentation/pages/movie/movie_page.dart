import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

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
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
                  'What kinda movie you wanna watch?',
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
  }
}
