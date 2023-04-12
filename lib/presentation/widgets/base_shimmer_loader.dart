import 'package:flutter/material.dart';
import 'package:gowatch/common/common.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmerLoader extends StatelessWidget {
  const BaseShimmerLoader({
    super.key,
    required this.height,
    this.width,
    this.disableBorderRadius = false,
  });

  final double height;
  final double? width;
  final bool disableBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Themes.primaryColor.withOpacity(0.3),
      highlightColor: Themes.primaryColor.withOpacity(0.1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius:
              !disableBorderRadius ? BorderRadius.circular(8.0) : null,
        ),
      ),
    );
  }
}
