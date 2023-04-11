import 'package:flutter/material.dart';

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
  //TODO: Open Hive box

  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<NavbarCubit>(),
      child: MaterialApp(
        title: MyConsts.appName,
        theme: Themes.myTheme,
        home: const MainPage(),
      ),
    );
  }
}
