import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:figma_to_flutter/common/resources/app_color.dart';
import 'package:figma_to_flutter/common/resources/app_strings.dart';
import 'package:figma_to_flutter/common/resources/assets.dart';
import 'package:figma_to_flutter/common/resources/routes.dart';
import 'package:figma_to_flutter/common/widgets/common_widgets.dart';
import 'package:figma_to_flutter/common/widgets/get_an_account_dialog.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColor.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 74.h),
                  Center(
                    child: Image.network(
                      Assets.logo,
                      width: 162.w,
                      height: 162.h,
                    ),
                  ),
                  SizedBox(height: 35.h),
                  RichText(
                    text: TextSpan(
                      text: AppStrings.welcomeTo,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textPrimary,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.checkWerk,
                          style: TextStyle(
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  AppColor.textSecondary,
                                  Color(0xFF2F80ED),
                                ],
                              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    AppStrings.loginSubtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.textHint,
                    ),
                  ),
                  SizedBox(height: 23.h),
                  const CustomTextField(
                    title: AppStrings.emailAddress,
                    hintText: AppStrings.enterEmailAddress,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    title: AppStrings.password,
                    hintText: AppStrings.enterPassword,
                    isPassword: true,
                    isObscure: _isPasswordObscure,
                    onVisibilityToggle: () {
                      setState(() {
                        _isPasswordObscure = !_isPasswordObscure;
                      });
                    },
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.forgotPassword,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 35.h),
                   PrimaryButton(
                    text: AppStrings.login,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.fillChecklistScreen);
                    },
                  ),
                  SizedBox(height: 12.h),
                  SecondaryButton(
                    text: AppStrings.getAnAccountButton,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const GetAnAccountDialog(),
                      );
                    },
                  ),
                   SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}