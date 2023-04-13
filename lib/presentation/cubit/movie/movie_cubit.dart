import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/data/repositories/repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final Repository repository;

  MovieCubit({required this.repository})
      : super(
          MovieState(
            state: ViewState.initial(),
            watchlistState: ViewState.initial(),
            movieResult: const [],
          ),
        );

  Future<void> getPopularMovies() async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getPopularMovies();
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              movieResult: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> getTopRatedMovies() async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getTopRatedMovies();
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              movieResult: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> getNowPlayingMovies() async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getNowPlayingMovies();
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              movieResult: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> getMovieDetail(int id) async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getDetailMovie(id);
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              movieResult: [data], //detail in index 0
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> addToWatchlist(WatchlistMdl watchlist) async {
    emit(state.copyWith(watchlistState: ViewState.loading()));

    try {
      final res = await repository.addToWatchlist(watchlist);
      res.fold(
        (failure) {
          emit(state.copyWith(watchlistState: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(watchlistState: ViewState.success(message: data)),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(watchlistState: ViewState.failed()));
    }
  }

  Future<void> removeFromWatchlist(String watchlistId) async {
    emit(state.copyWith(watchlistState: ViewState.loading()));

    try {
      final res = await repository.removeFromWatchlist(watchlistId);
      res.fold(
        (failure) {
          emit(state.copyWith(watchlistState: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(watchlistState: ViewState.success(message: data)),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(watchlistState: ViewState.failed()));
    }
  }
}
