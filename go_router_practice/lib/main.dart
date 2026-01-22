import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/screen/1_screen.dart';
import 'package:go_router_practice/screen/error_screen.dart';
import 'package:go_router_practice/screen/home_screen.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  GoRouter get _router => GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return ErrorScreen(error: staet.error.toString());
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (_, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'one',
            builder: (_, state) => OneScreen(),
            routes: [GoRoute(path: 'two', builder: (_, state) => TwoScreen())],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      // URI string을 상태 및 go router에서 사용할 수 있는 형태로 변환해주는 함수
      routeInformationParser: _router.routeInformationParser,

      // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수
      routerDelegate: _router.routerDelegate,
    );
  }
}
