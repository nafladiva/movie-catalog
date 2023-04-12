part of 'tv_show_cubit.dart';

class TVShowState extends Equatable {
  const TVShowState({
    this.state,
    this.watchlistState,
    this.tvShowResult,
  });

  final ViewState? state;
  final ViewState? watchlistState;
  final List<TVShowMdl>? tvShowResult;

  TVShowState copyWith({
    ViewState? state,
    ViewState? watchlistState,
    List<TVShowMdl>? tvShowResult,
  }) {
    return TVShowState(
      state: state ?? this.state,
      watchlistState: watchlistState ?? this.watchlistState,
      tvShowResult: tvShowResult ?? this.tvShowResult,
    );
  }

  @override
  List<Object?> get props => [state, watchlistState, tvShowResult];
}
