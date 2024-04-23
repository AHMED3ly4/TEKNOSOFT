import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final double? height;
  final Widget? child;

  const ShimmerLoading({super.key, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: child ??  Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
      padding: const EdgeInsetsDirectional.all(8),
      height: 130.h,
      width: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(),
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        children: [
          SizedBox(
            width: 120.w,
            height: 113.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180.w,
                child: Text(
                  "A product",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Text(
                "EGP Price",
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.delete),
              const Spacer(),
              Container(
                padding: const EdgeInsetsDirectional.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(23.r)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.remove_circle_outline,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text(
                      "1",
                      style: TextStyle(
                          fontSize: 22),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Icon(
                      Icons.add_circle_outline,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
      ),
    );
  }
}
