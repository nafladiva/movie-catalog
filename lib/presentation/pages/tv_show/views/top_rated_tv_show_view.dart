import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class TopRatedTVShowView extends StatefulWidget {
  const TopRatedTVShowView({
    Key? key,
  }) : super(key: key);

  @override
  State<TopRatedTVShowView> createState() => _TopRatedTVShowViewState();
}

class _TopRatedTVShowViewState extends State<TopRatedTVShowView> {
  late TVShowCubit tvShowCubit;

  @override
  void initState() {
    super.initState();
    tvShowCubit = locator<TVShowCubit>();
    tvShowCubit.getTopRatedTVShows();
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Rated TV Shows',
                style: TStyles.heading1(),
              ),
              const SizedBox(height: 10.0),
              if (state.tvShowResult?.isNotEmpty ?? false) ...[
                HorizontalItemList.tvShow(
                  tvShowList: state.tvShowResult ?? [],
                ),
              ] else if (state.state?.isError ?? false) ...[
                const DefaultError(),
              ] else ...[
                const HorizontalListLoader(),
              ],
            ],
          );
        },
      ),
    );
  }
}
