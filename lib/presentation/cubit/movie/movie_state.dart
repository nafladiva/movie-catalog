part of 'movie_cubit.dart';

class MovieState extends Equatable {
  const MovieState({
    this.state,
    this.movieResult,
  });

  final ViewState? state;
  final List<MovieMdl>? movieResult;

  MovieState copyWith({
    ViewState? state,
    List<MovieMdl>? movieResult,
  }) {
    return MovieState(
      state: state ?? this.state,
      movieResult: movieResult ?? this.movieResult,
    );
  }

  @override
  List<Object?> get props => [state, movieResult];
}
