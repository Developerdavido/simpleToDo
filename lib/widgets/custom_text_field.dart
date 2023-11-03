import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextInputAction? inputAction;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final TextEditingController? controller;
  const CustomTextField({Key? key,
    this.inputAction,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.controller,
    this.hintText,
    this.enabled = true,
    this.suffix,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var outlineBorder = OutlineInputBorder(
        borderSide: const BorderSide(
          color:Colors.transparent,
        ), borderRadius: BorderRadius.circular(8.r)
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 1.sw,
          child: TextFormField(
            textInputAction: widget.inputAction,
            autofocus: false,
            validator: widget.validator,
            decoration: InputDecoration(
              isDense: false,
              filled: true,
              errorMaxLines: 2,
              hintStyle: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.grey
              ),
              errorStyle: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 16.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.w400
              ),
              hintText: widget.hintText,
              focusedBorder: outlineBorder,
              disabledBorder: outlineBorder,
              enabledBorder: outlineBorder,
              border: outlineBorder,
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
            ),
            keyboardType: widget.keyboardType,
            style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.onPrimaryDark,
                fontSize: 16.sp
            ),
            cursorColor: AppColors.onPrimaryDark,
            controller: widget.controller,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            enabled: widget.enabled,
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

}