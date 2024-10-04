import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/about/presentation/pages/about_page.dart';
import '../../features/contact/presentation/pages/contact_page.dart';
import '../../features/experiance/presentation/pages/experiance_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/projects/presentation/pages/projects_page.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRoutes.homeRoute,
        path: '/',
        //builder: (context, state) => const HomePage(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 1000),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.aboutRoute,
        path: '/about',
        //builder: (context, state) => AboutPage(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AboutPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            /* transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },*/
            transitionDuration: const Duration(milliseconds: 1000),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.projectsRoute,
        path: '/projects',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ProjectsPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 1000),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.contactRoute,
        path: '/contact',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ContactPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 1000),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.experianceRoute,
        path: '/experiance',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ExperiancePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 1000),
          );
        },
      ),
    ],
  );
}

class AppRoutes {
  static const String homeRoute = 'home';
  static const String aboutRoute = 'about';
  static const String experianceRoute = 'experiance';
  static const String projectsRoute = 'projects';
  static const String contactRoute = 'contact';
}
