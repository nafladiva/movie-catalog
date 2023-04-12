import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Themes.primaryColor,
        padding: const EdgeInsets.all(12.0),
        shadowColor: Themes.primaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: Themes.defaultColor),
          const SizedBox(width: 5.0),
          Text(
            text,
            style: TStyles.subheading1(color: Themes.defaultColor),
          ),
        ],
      ),
    );
  }
}
