import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:figma_to_flutter/common/resources/app_color.dart';
import 'package:figma_to_flutter/common/resources/app_strings.dart';
import 'package:figma_to_flutter/common/resources/assets.dart';
import 'package:figma_to_flutter/common/widgets/common_widgets.dart';

class GetAnAccountDialog extends StatelessWidget {
  const GetAnAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      insetPadding: EdgeInsets.all(20.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.getAnAccountDialogTitle,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: AppColor.textHint),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Image.network(
              Assets.accountIllustration,
              height: 120.h,
              width: 120.w,
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.getAnAccountDialogContent,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.textHint,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24.h),
            PrimaryButton(
              text: AppStrings.registerOnWebsite,
              onPressed: () {
                // Handle website navigation
              },
            ),
          ],
        ),
      ),
    );
  }
}