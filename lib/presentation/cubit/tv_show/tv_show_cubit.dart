import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/data/repositories/repository.dart';

part 'tv_show_state.dart';

class TVShowCubit extends Cubit<TVShowState> {
  final Repository repository;

  TVShowCubit({required this.repository})
      : super(
          TVShowState(
            state: ViewState.initial(),
            watchlistState: ViewState.initial(),
            tvShowResult: const [],
          ),
        );

  Future<void> getPopularTVShows() async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getPopularTVShows();
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              tvShowResult: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> getTopRatedTVShows() async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getTopRatedTVShows();
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              tvShowResult: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> getOnTheAirTVShows() async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getOnTheAirTVShows();
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              tvShowResult: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> getTVShowDetail(int id) async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getDetailTVShow(id);
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              tvShowResult: [data], //detail in index 0
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
