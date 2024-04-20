import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_theme.dart';

class DefaultElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const DefaultElevatedButton({super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(398.w, 64.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r)
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppTheme.blueColor
        ),
      ),
    );
  }
}
