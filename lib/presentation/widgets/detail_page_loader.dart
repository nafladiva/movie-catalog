import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPageLoader extends StatelessWidget {
  const DetailPageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 300.0,
        maxHeight: 800.0,
        color: Themes.defaultColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        body: const BaseShimmerLoader(height: 14, disableBorderRadius: true),
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Container(
                width: 90,
                height: 5,
                decoration: BoxDecoration(
                  color: Themes.primaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              const SizedBox(height: 20.0),
              const BaseShimmerLoader(height: 20, width: 300),
              const SizedBox(height: 15.0),
              Divider(
                color: Themes.primaryColor.withOpacity(0.2),
                thickness: 2.0,
              ),
              const SizedBox(height: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genres',
                    style: TStyles.subheading2(),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 8.0,
                    children: const [
                      BaseShimmerLoader(height: 17, width: 60),
                      BaseShimmerLoader(height: 17, width: 60),
                      BaseShimmerLoader(height: 17, width: 60),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    'Rating',
                    style: TStyles.subheading2(),
                  ),
                  const SizedBox(height: 8.0),
                  const BaseShimmerLoader(height: 20, width: 70),
                  const SizedBox(height: 25.0),
                  Text(
                    'Release Date',
                    style: TStyles.subheading2(),
                  ),
                  const SizedBox(height: 8.0),
                  const BaseShimmerLoader(height: 15, width: 100),
                  const SizedBox(height: 25.0),
                  Text(
                    'Overview',
                    style: TStyles.subheading2(),
                  ),
                  const SizedBox(height: 8.0),
                  const BaseShimmerLoader(height: 12),
                  const SizedBox(height: 5.0),
                  const BaseShimmerLoader(height: 12),
                  const SizedBox(height: 5.0),
                  const BaseShimmerLoader(height: 12),
                  const SizedBox(height: 5.0),
                  const BaseShimmerLoader(height: 12),
                  const SizedBox(height: 40.0),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
