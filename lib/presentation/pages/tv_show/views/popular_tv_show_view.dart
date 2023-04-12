import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/injection.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class PopularTVShowView extends StatefulWidget {
  const PopularTVShowView({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularTVShowView> createState() => _PopularTVShowViewState();
}

class _PopularTVShowViewState extends State<PopularTVShowView> {
  late TVShowCubit tvShowCubit;

  @override
  void initState() {
    super.initState();
    tvShowCubit = locator<TVShowCubit>();
    tvShowCubit.getPopularTVShows();
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
                'Popular TV Shows',
                style: TStyles.heading1(),
              ),
              const SizedBox(height: 10.0),
              if (state.state?.isLoading ?? false) ...[
                const HorizontalListLoader(),
              ] else if (state.state?.isError ?? false) ...[
                const SizedBox(),
              ] else ...[
                HorizontalItemList.tvShow(
                  tvShowList: state.tvShowResult ?? [],
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
