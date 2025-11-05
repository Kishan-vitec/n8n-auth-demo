import 'package:flutter/material.dart';
import 'package:figma_to_flutter/presentation/authentication/sign_in/page/login_screen.dart';
import 'package:figma_to_flutter/presentation/checklists/page/fill_checklist_screen.dart';


class AppRoutes {
  static const String loginScreen = '/login';
  static const String fillChecklistScreen = '/fillChecklist';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case fillChecklistScreen:
        return MaterialPageRoute(builder: (_) => const FillChecklistScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}