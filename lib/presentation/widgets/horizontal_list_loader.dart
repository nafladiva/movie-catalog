import 'package:flutter/material.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

class HorizontalListLoader extends StatelessWidget {
  const HorizontalListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          BaseShimmerLoader(height: 180, width: 125),
          SizedBox(width: 10),
          BaseShimmerLoader(height: 180, width: 125),
          SizedBox(width: 10),
          BaseShimmerLoader(height: 180, width: 125),
          SizedBox(width: 10),
          BaseShimmerLoader(height: 180, width: 125),
        ],
      ),
    );
  }
}
