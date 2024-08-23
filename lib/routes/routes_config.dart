import 'package:altel_group_web/pages/home_page.dart';
import 'package:altel_group_web/pages/initial_page.dart';
import 'package:altel_group_web/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteConfig {
  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: "/",
          name: RouteNames.initial,
          pageBuilder: (context, state) {
            return const MaterialPage(child: InitialPage());
          },
        ), // GoRoute
        GoRoute(
          path: "/home-page",
          name: RouteNames.homePage,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: HomePage(),
            );
          },
        ),
        GoRoute(
          path: "/about-us",
          name: RouteNames.aboutUs,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Animation Transition
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
                // return SlideTransition(
                //   position: Tween<Offset>(
                //     begin: Offset(-1, -1), // Slides in from the right
                //     end: Offset.zero,
                //   ).animate(animation),
                //   child: child,
                // );
                // return FadeTransition(
                //   opacity: animation,
                //   child: child,
                // );
              },
            );
          },
        ), // GoRoute // GoRoute
      ],
      errorPageBuilder: (contetext, state) {
        return const MaterialPage(
          child: InitialPage(),
        );
      },
    ); // GoRouter
  }
}
