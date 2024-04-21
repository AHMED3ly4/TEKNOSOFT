import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  const NavBarIcon({super.key, required this.iconPath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.r,
      backgroundColor: isSelected? AppTheme.whiteColor : Colors.transparent,
      child: ImageIcon(
       AssetImage(
         iconPath,
       ),
        color: isSelected? AppTheme.blueColor:AppTheme.whiteColor,
      ),
    );
  }
}
