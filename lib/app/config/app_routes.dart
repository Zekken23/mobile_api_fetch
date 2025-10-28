import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:assigment2/app/modules/auth/login_screen.dart';
import 'package:assigment2/app/modules/auth/signup_screen.dart';
import 'package:assigment2/app/modules/home/home_binding.dart';
import 'package:assigment2/app/modules/home/home_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/'; 

  static final GoRouter router = GoRouter(
    initialLocation: login, 
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: home,
        pageBuilder: (context, state) {
          HomeBinding().dependencies();
          return const MaterialPage(
            child: HomeScreen(),
          );
        },
      ),
    ],
  );
}