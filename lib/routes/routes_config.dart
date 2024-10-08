import 'package:altel_group_web/pages/about_us_page.dart';
import 'package:altel_group_web/pages/career_page.dart';
import 'package:altel_group_web/pages/contact_page.dart';
// import 'package:altel_group_web/pages/dupa_page.dart';
import 'package:altel_group_web/pages/home_page.dart';
import 'package:altel_group_web/pages/initial_page.dart';
import 'package:altel_group_web/pages/offer_page.dart';
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
            final GlobalKey? aboutUsContainerKey = state.extra as GlobalKey?;
            return MaterialPage(
              child: InitialPage(
                pageName: RouteNames.aboutUs,
                page: AboutUsPage(
                  containerKey: aboutUsContainerKey,
                ),
              ),
            );
          },
        ),
        // GoRoute(
        //   path: "/about-us",
        //   name: RouteNames.aboutUs,
        //   pageBuilder: (context, state) {
        //     // final GlobalKey aboutUsContainerKey = state.extra as GlobalKey;
        //     final GlobalKey? aboutUsContainerKey = state.extra as GlobalKey?;
        //     return CustomTransitionPage(
        //       child: InitialPage(
        //         pageName: RouteNames.aboutUs,
        //         page: AboutUsPage(
        //           containerKey: aboutUsContainerKey,
        //         ),
        //       ),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: animation,
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ), // GoRoute
        GoRoute(
          path: "/offer",
          name: RouteNames.offer,
          pageBuilder: (context, state) {
            final GlobalKey? offerContainerKey = state.extra as GlobalKey?;
            return MaterialPage(
              child: InitialPage(
                pageName: RouteNames.offer,
                page: OfferPage(containerKey: offerContainerKey),
              ),
            );
          },
        ),
        GoRoute(
          path: "/career",
          name: RouteNames.career,
          pageBuilder: (context, state) {
            final GlobalKey? careerContainerKey = state.extra as GlobalKey?;
            return MaterialPage(
              child: InitialPage(
                pageName: RouteNames.career,
                page: CareerPage(containerKey: careerContainerKey),
              ),
            );
          },
        ),
        GoRoute(
          path: "/contact",
          name: RouteNames.contact,
          pageBuilder: (context, state) {
            final GlobalKey? contactContainerKey = state.extra as GlobalKey?;
            return MaterialPage(
              child: InitialPage(
                pageName: RouteNames.contact,
                page: ContactPage(containerKey: contactContainerKey),
              ),
            );
          },
        ),
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

// **************************************************************************************************

// import 'package:altel_group_web/pages/about_us_page.dart';
// import 'package:altel_group_web/pages/career_page.dart';
// import 'package:altel_group_web/pages/contact_page.dart';
// import 'package:altel_group_web/pages/home_page.dart';
// import 'package:altel_group_web/pages/initial_page.dart';
// import 'package:altel_group_web/pages/offer_page.dart';
// import 'package:altel_group_web/routes/routes_name.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class RouteConfig {
//   static GoRouter returnRouter() {
//     return GoRouter(
//       initialLocation: "/",
//       routes: [
//         GoRoute(
//           path: "/",
//           name: RouteNames.initial,
//           pageBuilder: (context, state) {
//             return const MaterialPage(
//               child: InitialPage(
//                 pageName: RouteNames.initial,
//                 page: HomePage(),
//               ),
//             );
//           },
//           routes: [
//             GoRoute(
//               path: "home-page",
//               name: RouteNames.homePage,
//               pageBuilder: (context, state) {
//                 return const MaterialPage(
//                   child: InitialPage(
//                     pageName: RouteNames.homePage,
//                     page: HomePage(),
//                   ),
//                 );
//               },
//             ),
//             GoRoute(
//               path: "about-us",
//               name: RouteNames.aboutUs,
//               pageBuilder: (context, state) {
//                 final GlobalKey? aboutUsContainerKey =
//                     state.extra as GlobalKey?;
//                 return CustomTransitionPage(
//                   child: InitialPage(
//                     pageName: RouteNames.aboutUs,
//                     page: AboutUsPage(
//                       containerKey: aboutUsContainerKey,
//                     ),
//                   ),
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     // Zdefiniowanie animacji fade z czasem trwania 3 sekundy
//                     final tween = Tween(begin: 0.0, end: 1.0).animate(
//                       CurvedAnimation(
//                         parent: animation,
//                         curve:
//                             const Interval(0.0, 1.0, curve: Curves.easeInOut),
//                       ),
//                     );
//                     return FadeTransition(
//                       opacity: tween,
//                       child: child,
//                     );
//                   },
//                   transitionDuration:
//                       const Duration(seconds: 1), // Dodanie opóźnienia
//                 );
//               },
//             ),
//             GoRoute(
//               path: "offer",
//               name: RouteNames.offer,
//               pageBuilder: (context, state) {
//                 final GlobalKey? offerContainerKey = state.extra as GlobalKey?;
//                 return CustomTransitionPage(
//                   child: InitialPage(
//                     pageName: RouteNames.offer,
//                     page: OfferPage(containerKey: offerContainerKey),
//                   ),
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     final tween = Tween(begin: 0.0, end: 1.0).animate(
//                       CurvedAnimation(
//                         parent: animation,
//                         curve:
//                             const Interval(0.0, 1.0, curve: Curves.easeInOut),
//                       ),
//                     );
//                     return FadeTransition(
//                       opacity: tween,
//                       child: child,
//                     );
//                   },
//                   transitionDuration: const Duration(seconds: 1),
//                 );
//               },
//             ),
//             GoRoute(
//               path: "career",
//               name: RouteNames.career,
//               pageBuilder: (context, state) {
//                 final GlobalKey? careerContainerKey = state.extra as GlobalKey?;
//                 return CustomTransitionPage(
//                   child: InitialPage(
//                     pageName: RouteNames.career,
//                     page: CareerPage(containerKey: careerContainerKey),
//                   ),
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     final tween = Tween(begin: 0.0, end: 1.0).animate(
//                       CurvedAnimation(
//                         parent: animation,
//                         curve:
//                             const Interval(0.0, 1.0, curve: Curves.easeInOut),
//                       ),
//                     );
//                     return FadeTransition(
//                       opacity: tween,
//                       child: child,
//                     );
//                   },
//                   transitionDuration: const Duration(seconds: 1),
//                 );
//               },
//             ),
//             GoRoute(
//               path: "contact",
//               name: RouteNames.contact,
//               pageBuilder: (context, state) {
//                 final GlobalKey? contactContainerKey =
//                     state.extra as GlobalKey?;
//                 return CustomTransitionPage(
//                   child: InitialPage(
//                     pageName: RouteNames.contact,
//                     page: ContactPage(containerKey: contactContainerKey),
//                   ),
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     final tween = Tween(begin: 0.0, end: 1.0).animate(
//                       CurvedAnimation(
//                         parent: animation,
//                         curve:
//                             const Interval(0.0, 1.0, curve: Curves.easeInOut),
//                       ),
//                     );
//                     return FadeTransition(
//                       opacity: tween,
//                       child: child,
//                     );
//                   },
//                   transitionDuration: const Duration(seconds: 1),
//                 );
//               },
//             ),
//           ],
//         ),
//       ],
//       errorPageBuilder: (context, state) {
//         return const MaterialPage(
//           child: InitialPage(
//             pageName: RouteNames.initial,
//             page: HomePage(),
//           ),
//         );
//       },
//     );
//   }
// }
