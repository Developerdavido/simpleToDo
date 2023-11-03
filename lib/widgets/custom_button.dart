import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_to_do/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final VoidCallback? onTap;
  final Color? btnColor;
  final double? titleSize;
  final FontWeight? fontWeight;
  final double? iconSize;
  const CustomButton(
      {Key? key,
        required this.title,
        this.onTap,
        this.fontWeight,
        this.iconSize,
        this.titleSize,
        this.titleColor,
        this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8.r)),
        child: Center(
          child:  Text(
           title,
            style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.onPrimaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 24.sp),
          ),
        )
      ),
    );
  }
}
