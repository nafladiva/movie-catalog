import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Themes.orangeColor.withOpacity(0.2),
        border: Border.all(
          color: Themes.orangeColor,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        'Action',
        style: TStyles.subheading3(color: Themes.orangeColor),
      ),
    );
  }
}
