import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class TopRatedMovieView extends StatefulWidget {
  const TopRatedMovieView({
    Key? key,
  }) : super(key: key);

  @override
  State<TopRatedMovieView> createState() => _TopRatedMovieViewState();
}

class _TopRatedMovieViewState extends State<TopRatedMovieView> {
  late MovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = locator<MovieCubit>();
    movieCubit.getTopRatedMovies();
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Rated Movies',
                style: TStyles.heading1(),
              ),
              const SizedBox(height: 10.0),
              if (state.movieResult?.isNotEmpty ?? false) ...[
                HorizontalItemList.movie(
                  movieList: state.movieResult ?? [],
                ),
              ] else if (state.state?.isError ?? false) ...[
                const DefaultError(),
              ] else ...[
                const HorizontalListLoader(),
              ],
            ],
          );
        },
      ),
    );
  }
}
