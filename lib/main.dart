import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowatch/presentation/cubit/navbar/navbar_cubit.dart';
import 'package:gowatch/presentation/pages/pages.dart';

import 'common/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: MaterialApp(
        title: 'GoWatch',
        theme: Themes.myTheme,
        home: const MainPage(),
      ),
    );
  }
}
