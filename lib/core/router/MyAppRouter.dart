import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mxpertx/core/router/router_constants.dart';
import 'package:mxpertx/features/comment/screens/comment_screen.dart';
import 'package:mxpertx/features/home/screens/feed_screen.dart';
import 'package:mxpertx/features/home/screens/home_screens.dart';
import 'package:mxpertx/features/login/screens/login_screen.dart';
import 'package:mxpertx/features/login/screens/register_screen.dart';
import 'package:mxpertx/features/login/screens/sign_in_screen.dart';
import 'package:mxpertx/features/message/screen/messages_screen.dart';
import 'package:mxpertx/features/profile/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouterConstants.login,
        path: '/login',
        pageBuilder: (context, state) => MaterialPage(
          child: LoginScreen(),
        ),
        routes: [
          GoRoute(
            name: RouterConstants.signin,
            path: 'signin',
            pageBuilder: (context, state) => MaterialPage(
              child: SignInScreen(),
            ),
          ),
          GoRoute(
            name: RouterConstants.register,
            path: 'register',
            pageBuilder: (context, state) => MaterialPage(
              child: RegisterScreen(),
            ),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: ((context, state, navigationShell) =>
            HomeScreen(navigationShell: navigationShell)),
        branches: [
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              name: RouterConstants.home,
              path: '/',
              builder: (context, state) {
                return const FeedScreen();
              },
            ),
          ]),
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              name: RouterConstants.comment,
              path: '/comment',
              builder: (context, state) {
                return CommentScreen();
              },
            ),
          ]),
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              name: RouterConstants.message,
              path: '/message',
              builder: (context, state) {
                return MessageScreen();
              },
            ),
          ]),
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              name: RouterConstants.profile,
              path: '/profile',
              builder: (context, state) {
                return ProfileScreen();
              },
            ),
          ]),
        ],
      ),
    ],
    redirect: (context, state) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? user = prefs.getString('user');
      if (user == null && state.matchedLocation == '/') {
        return state.namedLocation(RouterConstants.login);
      }
      return null;
    },
  );
}
