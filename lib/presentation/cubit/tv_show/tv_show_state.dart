part of 'tv_show_cubit.dart';

class TVShowState extends Equatable {
  const TVShowState({
    this.state,
    this.tvShowResult,
  });

  final ViewState? state;
  final List<TVShowMdl>? tvShowResult;

  TVShowState copyWith({
    ViewState? state,
    List<TVShowMdl>? tvShowResult,
  }) {
    return TVShowState(
      state: state ?? this.state,
      tvShowResult: tvShowResult ?? this.tvShowResult,
    );
  }

  @override
  List<Object?> get props => [state, tvShowResult];
}
