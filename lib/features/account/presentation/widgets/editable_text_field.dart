import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditableTextField extends StatelessWidget {

  EditableTextField({
    required this.label,
    super.key,
    this.content,
    this.isEditable=true,
    this.onTabSuffixIcon,
    this.controller,
    this.validator,
    this.enabled= false,
    this.suffixIcon= const Icon(Icons.edit),
  });
  final String? content;
  final String label;
  final bool isEditable;
  Widget suffixIcon;
  bool enabled ;
  void Function()? onTabSuffixIcon;
  TextEditingController? controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppTheme.blueColor),
        ),
        SizedBox(height:8.h),
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            TextFormField(
              validator: validator,
              enabled: enabled,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppTheme.blackColor),
              controller:content != null ? TextEditingController(text: content):controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 2,horizontal: 6),
              ),
            ),
            isEditable ?
            IconButton(
                onPressed: onTabSuffixIcon,
                icon: suffixIcon
            )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
