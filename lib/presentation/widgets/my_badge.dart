import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Themes.orangeColor.withOpacity(0.2),
        border: Border.all(
          color: Themes.orangeColor,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        text,
        style: TStyles.paragraph2(color: Themes.orangeColor),
      ),
    );
  }
}
