import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/injection.dart' as di;

import 'common/common.dart';
import 'data/models/models.dart';
import 'presentation/cubit/cubit.dart';
import 'presentation/pages/pages.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WatchlistMdlAdapter());
  await Hive.openBox<WatchlistMdl>(MyConsts.watchlistBox);

  di.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.locator<NavbarCubit>()),
        BlocProvider(create: (context) => di.locator<WatchlistCubit>()),
      ],
      child: MaterialApp(
        title: MyConsts.appName,
        theme: Themes.myTheme,
        home: const MainPage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case MovieDetailPage.routeName:
              int arg = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: arg),
              );
            case TVShowDetailPage.routeName:
              int arg = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVShowDetailPage(id: arg),
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
