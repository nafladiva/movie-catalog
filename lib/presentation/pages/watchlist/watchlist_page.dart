import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/presentation/cubit/cubit.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  late WatchlistCubit watchlistCubit;

  @override
  void initState() {
    super.initState();
    watchlistCubit = context.read<WatchlistCubit>();
    watchlistCubit.getWatchlist();

    print('reload');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: watchlistCubit,
      child: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          print('Watchlist: ${state.watchlist?.length}');

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your watchlist',
                        style: TStyles.heading1(),
                      ),
                      const SizedBox(height: 25.0),
                      if (state.state?.isLoading ?? false) ...[
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                      if (state.state?.isSuccess ?? false) ...[
                        if (state.watchlist?.isNotEmpty ?? false) ...[
                          Column(
                            children: [
                              ...(state.watchlist ?? []).map(
                                (item) => WatchlistCard(watchlist: item),
                              ),
                            ],
                          )
                        ] else ...[
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sentiment_dissatisfied_outlined,
                                  color: Themes.whiteColor.withOpacity(0.7),
                                  size: 30.0,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Your watchlist is empty',
                                  style: TStyles.subheading2(
                                    color: Themes.whiteColor.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
