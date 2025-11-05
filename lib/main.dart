import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:figma_to_flutter/common/resources/app_color.dart';
import 'package:figma_to_flutter/common/resources/routes.dart';
import 'package:figma_to_flutter/presentation/authentication/sign_in/page/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Figma to Flutter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColor.primaryColor,
            scaffoldBackgroundColor: AppColor.backgroundColor,
            fontFamily: 'Roboto',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: AppRoutes.generateRoute,
          home: const LoginScreen(),
        );
      },
    );
  }
}