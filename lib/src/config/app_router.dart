import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dating_template/src/features/auth/presentation/view/login_screen.dart';
import 'package:flutter_dating_template/src/features/auth/presentation/view/signup_screen.dart';
import 'package:flutter_dating_template/src/features/feed/presentation/view/discover_screen.dart';
import 'package:flutter_dating_template/src/features/feed/presentation/view/feed_screen.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          name: 'feed',
          path: '/feed',
          builder: (BuildContext context, GoRouterState state) {
            return const FeedScreen();
          }),
      GoRoute(
          name: 'discover',
          path: '/discover',
          builder: (BuildContext context, GoRouterState state) {
            return const DiscoverScreen();
          },
          routes: [
            GoRoute(
              path: 'user',
              name: ':userId',
              builder: (context, state) {
                return Container();
              },
            )
          ]),          
      GoRoute(
          name: 'login',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
          routes: [
            GoRoute(
              path: 'signup',
              name: 'signup',
              builder: (context, state) {
                return const SignupScreen();
              },
            )
          ]),
    ],
    //Todo:Redirect users to to the login screen
    // redirect: 
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}