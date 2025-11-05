import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:figma_to_flutter/common/resources/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  final bool isObscure;
  final VoidCallback? onVisibilityToggle;
  final String? validationIcon;
  final String? additionalInfo;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.isPassword = false,
    this.isObscure = false,
    this.onVisibilityToggle,
    this.validationIcon,
    this.additionalInfo,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.textHint,
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.error,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: AppColor.textHint,
            ),
            filled: true,
            fillColor: AppColor.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColor.textSecondary, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColor.error, width: 1),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: SvgPicture.network(
                      isObscure
                          ? "https://raw.githubusercontent.com/hovey/fir-svg-icons/master/show-outline.svg"
                          : "https://raw.githubusercontent.com/hovey/fir-svg-icons/master/hide-outline.svg",
                      colorFilter: const ColorFilter.mode(AppColor.textHint, BlendMode.srcIn),
                      width: 20.w,
                      height: 20.h,
                    ),
                    onPressed: onVisibilityToggle,
                  )
                : validationIcon != null
                    ? Padding(
                      padding: EdgeInsets.all(10.r),
                      child: SvgPicture.network(
                        validationIcon!,
                        colorFilter: const ColorFilter.mode(AppColor.success, BlendMode.srcIn),
                         width: 20.w,
                         height: 20.h,
                        ),
                    )
                    : null,
          ),
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.textPrimary,
          ),
        ),
        if (additionalInfo != null)
         Padding(
           padding: EdgeInsets.only(top: 3.h),
           child: Text(
              additionalInfo!,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.textHint,
              ),
            ),
         ),
      ],
    );
  }
}


class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 5,
        shadowColor: AppColor.primaryColor.withOpacity(0.3),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.textPrimary,
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h),
        side: const BorderSide(color: AppColor.primaryColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.textPrimary,
        ),
      ),
    );
  }
}