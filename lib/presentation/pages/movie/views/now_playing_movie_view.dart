import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class NowPlayingMovieView extends StatefulWidget {
  const NowPlayingMovieView({
    Key? key,
  }) : super(key: key);

  @override
  State<NowPlayingMovieView> createState() => _NowPlayingMovieViewState();
}

class _NowPlayingMovieViewState extends State<NowPlayingMovieView> {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = locator<MovieCubit>();
    movieCubit.getNowPlayingMovies();
  }

  @override
  void dispose() {
    movieCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state.state?.isError ?? false) {
            return const DefaultError();
          }

          return CarouselSlider.movie(movieList: state.movieResult ?? []);
        },
      ),
    );
  }
}
