import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/data/models/genre_mdl.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({
    super.key,
    required this.genre,
  });

  final GenreMdl genre;

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
        genre.name ?? '',
        style: TStyles.paragraph2(color: Themes.orangeColor),
      ),
    );
  }
}
