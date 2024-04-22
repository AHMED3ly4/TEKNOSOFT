import 'package:e_commerce/features/home/presentation/widgets/home_subsection.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget child;
  final double? height;
  const ShimmerLoading({super.key, this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: child,
      ),
    );
  }
}
