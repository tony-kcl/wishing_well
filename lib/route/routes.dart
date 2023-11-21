import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wishing_well/pages/pages.dart';

class Routes {
  Routes._();

  static const String homeRoute = '/home';

  static final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    initialLocation: homeRoute,
    navigatorKey: _rootKey,
    routes: [
      GoRoute(
        path: homeRoute,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context, state: state, child: const HomeView(),
        ),
      ),
    ],
  );
}

CustomTransitionPage buildPageWithoutTransition<T>({
  required BuildContext context, 
  required GoRouterState state, 
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => 
      FadeTransition(opacity: animation, child: child),
  );
}