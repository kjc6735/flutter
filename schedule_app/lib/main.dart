import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_app/layout/default_layout.dart';
import 'package:schedule_app/screen/feed_screen.dart';
import 'package:schedule_app/screen/login_screen.dart';
import 'package:schedule_app/screen/register_screen.dart';
import 'package:schedule_app/screen/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: _App()));
}

final _router = GoRouter(
  initialLocation: '/splash',
  errorBuilder: (context, state) {
    return DefaultLayout(body: Text("error"));
  },
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (_, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (_, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (_, state) => RegisterScreen(),
    ),
    GoRoute(path: '/feed', name: 'feed', builder: (_, state) => FeedScreen()),
  ],
);

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: const Color(0xFF3182F6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3182F6),
          primary: const Color(0xFF3182F6),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
