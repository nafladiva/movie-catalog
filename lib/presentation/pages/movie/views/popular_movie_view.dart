import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class PopularMovieView extends StatefulWidget {
  const PopularMovieView({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularMovieView> createState() => _PopularMovieViewState();
}

class _PopularMovieViewState extends State<PopularMovieView> {
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
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Movies',
                style: TStyles.heading1(),
              ),
              const SizedBox(height: 10.0),
              if (state.state?.isLoading ?? false) ...[
                const HorizontalListLoader(),
              ] else if (state.state?.isError ?? false) ...[
                const DefaultError(),
              ] else ...[
                HorizontalItemList.movie(
                  movieList: state.movieResult ?? [],
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
