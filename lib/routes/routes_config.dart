import 'package:altel_group_web/pages/about_us_page.dart';
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
            return const MaterialPage(
              child: InitialPage(
                pageName: RouteNames.initial,
                page: HomePage(),
              ),
            );
          },
        ), // GoRoute
        GoRoute(
          path: "/home-page",
          name: RouteNames.homePage,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: InitialPage(
                pageName: RouteNames.homePage,
                page: HomePage(),
              ),
            );
          },
        ),
        GoRoute(
          path: "/about-us",
          name: RouteNames.aboutUs,
          pageBuilder: (context, state) {
            // final GlobalKey aboutUsContainerKey = state.extra as GlobalKey;
            final GlobalKey? aboutUsContainerKey = state.extra as GlobalKey?;
            return CustomTransitionPage(
              child: InitialPage(
                pageName: RouteNames.aboutUs,
                page: AboutUsPage(
                  containerKey: aboutUsContainerKey,
                ),
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ), // GoRoute
      ],
      errorPageBuilder: (contetext, state) {
        return const MaterialPage(
          child: InitialPage(
            pageName: RouteNames.initial,
            page: HomePage(),
          ),
        );
      },
    ); // GoRouter
  }
}
