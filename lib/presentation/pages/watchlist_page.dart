import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Watchlist Page',
          style: TStyles.heading1(),
        ),
      ),
    );
  }
}
