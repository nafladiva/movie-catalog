import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class TVShowPage extends StatelessWidget {
  const TVShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'TV Show Page',
          style: TStyles.heading1(),
        ),
      ),
    );
  }
}
