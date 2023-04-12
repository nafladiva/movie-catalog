part of 'movie_cubit.dart';

class MovieState extends Equatable {
  const MovieState({
    this.state,
    this.watchlistState,
    this.movieResult,
  });

  final ViewState? state;
  final ViewState? watchlistState;
  final List<MovieMdl>? movieResult;

  MovieState copyWith({
    ViewState? state,
    ViewState? watchlistState,
    List<MovieMdl>? movieResult,
  }) {
    return MovieState(
      state: state ?? this.state,
      watchlistState: watchlistState ?? this.watchlistState,
      movieResult: movieResult ?? this.movieResult,
    );
  }

  @override
  List<Object?> get props => [state, watchlistState, movieResult];
}
