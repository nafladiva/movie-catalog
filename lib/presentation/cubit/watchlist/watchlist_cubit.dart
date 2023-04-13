import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/models.dart';
import 'package:gowatch/data/repositories/repository.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final Repository repository;

  WatchlistCubit({required this.repository})
      : super(
          WatchlistState(
            state: ViewState.initial(),
            watchlist: const [],
          ),
        );

  Future<void> getWatchlist() async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.getWatchlist();
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              watchlist: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }

  Future<void> checkWatchlistStatus(String watchlistId) async {
    emit(state.copyWith(state: ViewState.loading()));

    try {
      final res = await repository.checkWatchlistStatus(watchlistId);
      res.fold(
        (failure) {
          emit(state.copyWith(state: ViewState.failed()));
        },
        (data) {
          emit(
            state.copyWith(
              state: ViewState.success(),
              isInWatchlist: data,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(state: ViewState.failed()));
    }
  }
}
