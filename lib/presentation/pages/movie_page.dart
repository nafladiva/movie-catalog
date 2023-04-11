import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

import '../widgets/widgets.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello! 👋',
                  style: TStyles.heading1(),
                ),
                Text(
                  'What kinda movie you wanna go?',
                  style: TStyles.paragraph1(),
                ),
                const SizedBox(height: 20.0),
                const CarouselSlider(),
                const SizedBox(height: 40.0),
                Text(
                  'Popular Movies',
                  style: TStyles.heading1(),
                ),
                const SizedBox(height: 10.0),
                const HorizontalItemList(),
                const SizedBox(height: 30.0),
                Text(
                  'Top Rated Movies',
                  style: TStyles.heading1(),
                ),
                const SizedBox(height: 10.0),
                const HorizontalItemList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
