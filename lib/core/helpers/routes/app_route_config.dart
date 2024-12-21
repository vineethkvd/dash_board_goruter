import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/view/dashboard_home.dart';
import '../../../features/home/view/shell/dashboard_shell.dart';
import 'app_route_name.dart';
import 'app_route_path.dart';

class AppRoutes {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  late final GoRouter appRouter;

  AppRoutes() {
    appRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesPath.dashboard,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return DashboardShell(child: child);
          },
          routes: [
            GoRoute(
              name: RoutesName.dashboard,
              path: RoutesPath.dashboard,
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                child: const DashboardHome(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              ),
              routes: [
                GoRoute(
                  name: RoutesName.productView,
                  path: 'view',
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const ProductView(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
                GoRoute(
                  name: RoutesName.productAdd,
                  path: 'add',
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const ProductAdd(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
                GoRoute(
                  name: RoutesName.productUpdate,
                  path: 'update',
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const ProductUpdate(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
                GoRoute(
                  name: RoutesName.productDelete,
                  path: 'delete',
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const ProductDelete(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
