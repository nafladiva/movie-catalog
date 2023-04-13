import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class DefaultError extends StatelessWidget {
  const DefaultError({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message ?? 'Something went wrong :(',
            style: TStyles.paragraph1(color: Themes.orangeColor),
          ),
          Text(
            'Try again later',
            style: TStyles.paragraph2(),
          ),
        ],
      ),
    );
  }
}
