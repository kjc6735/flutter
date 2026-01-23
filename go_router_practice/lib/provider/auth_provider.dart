import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/model/user_model.dart';
import 'package:go_router_practice/screen/1_screen.dart';
import 'package:go_router_practice/screen/2_screen.dart';
import 'package:go_router_practice/screen/error_screen.dart';
import 'package:go_router_practice/screen/home_screen.dart';
import 'package:go_router_practice/screen/login_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authStateProvider = AuthNotifier(ref: ref);

  return GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (_, state) => HomeScreen(),
        routes: authStateProvider._routes,
      ),
      GoRoute(path: '/login', builder: (_, state) => LoginScreen()),
    ],
  );
});

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({required this.ref}) {
    ref.listen<UserModel?>(userProvider, (prev, next) {
      if (prev != next) notifyListeners();
    });
  }

  List<GoRoute> get _routes => [
    GoRoute(
      path: 'one',
      builder: (_, state) => OneScreen(),
      routes: [GoRoute(path: 'two', builder: (_, state) => TwoScreen())],
    ),
  ];

  String? redirectLogic(GoRouterState state) {
    final user = ref.read(userProvider);

    final loggingIn = state.path == '/login';
    // 유저 정보가 없다 = 로그인한 상태가 아니다.
    //
    if (user == null) {
      return loggingIn ? null : '/login';
    }
  }
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  login({required String name}) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
