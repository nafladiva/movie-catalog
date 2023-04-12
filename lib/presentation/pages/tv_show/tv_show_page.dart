import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

import 'views/on_the_air_tv_show_view.dart';
import 'views/popular_tv_show_view.dart';
import 'views/top_rated_tv_show_view.dart';

class TVShowPage extends StatefulWidget {
  const TVShowPage({super.key});

  @override
  State<TVShowPage> createState() => _TVShowPageState();
}

class _TVShowPageState extends State<TVShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello! 👋',
                  style: TStyles.heading1(),
                ),
                Text(
                  'What kinda tv show you wanna watch?',
                  style: TStyles.paragraph1(),
                ),
                const SizedBox(height: 20.0),
                const OnTheAirTVShowView(),
                const SizedBox(height: 40.0),
                const PopularTVShowView(),
                const SizedBox(height: 30.0),
                const TopRatedTVShowView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
