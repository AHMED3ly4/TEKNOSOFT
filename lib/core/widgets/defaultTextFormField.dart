import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_theme.dart';

class DefaultTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController textController;
  final bool isPassword;
  final Widget? suffixIcon;
  String? Function(String?)? validator;
   DefaultTextFormField({super.key,
    required this.label,
    required this.hint,
    this.isPassword=false,
    this.suffixIcon,
    required this.textController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 24.h,
        ),
        TextFormField(
          controller: textController,
          validator: validator ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            fillColor: AppTheme.whiteColor,
            filled: true,
            hintText: hint,
            hintStyle:  Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppTheme.blackColor,
            ),
            suffixIcon: suffixIcon,
          ),
        ),

      ],
    );
  }
}
