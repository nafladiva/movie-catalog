import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class OnTheAirTVShowView extends StatefulWidget {
  const OnTheAirTVShowView({
    Key? key,
  }) : super(key: key);

  @override
  State<OnTheAirTVShowView> createState() => _OnTheAirTVShowViewState();
}

class _OnTheAirTVShowViewState extends State<OnTheAirTVShowView> {
  late TVShowCubit tvShowCubit;

  @override
  void initState() {
    super.initState();
    tvShowCubit = locator<TVShowCubit>();
    tvShowCubit.getOnTheAirTVShows();
  }

  @override
  void dispose() {
    tvShowCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: tvShowCubit,
      child: BlocBuilder<TVShowCubit, TVShowState>(
        builder: (context, state) {
          if (state.state?.isError ?? false) {
            return const DefaultError();
          }

          return CarouselSlider.tvShow(tvShowList: state.tvShowResult ?? []);
        },
      ),
    );
  }
}
