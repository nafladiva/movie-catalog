part of 'watchlist_cubit.dart';

class WatchlistState extends Equatable {
  const WatchlistState({
    this.state,
    this.watchlist,
    this.isInWatchlist = false,
  });

  final ViewState? state;
  final List<WatchlistMdl>? watchlist;
  final bool isInWatchlist;

  WatchlistState copyWith({
    ViewState? state,
    List<WatchlistMdl>? watchlist,
    bool? isInWatchlist,
  }) {
    return WatchlistState(
      state: state ?? this.state,
      watchlist: watchlist ?? this.watchlist,
      isInWatchlist: isInWatchlist ?? this.isInWatchlist,
    );
  }

  @override
  List<Object?> get props => [state, watchlist, isInWatchlist];
}
