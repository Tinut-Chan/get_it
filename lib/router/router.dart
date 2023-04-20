import 'package:flutter/material.dart';
import 'package:getit_project/core/splash_screen/splash_screen.dart';
import 'package:getit_project/module/dashboard/bottomnavigation_bar.dart';
import 'package:getit_project/module/home/screen/home_screen.dart';
import 'package:getit_project/module/personal_profile/screen/personal_profile.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  initialLocation: "/splash-screen",
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (_, state, child) {
        return BottomNavigationBarScreen(child: child);
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          name: 'Home',
          path: '/',
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          name: 'Profile',
          path: '/personal-profile',
          builder: (_, state) {
            return const PersonalProfileScreen();
          },
        ),
      ],
    ),
    GoRoute(
      name: 'Splash Screen',
      path: '/splash-screen',
      builder: (_, state) {
        return const SplashScreen();
      },
    ),
  ],
);
