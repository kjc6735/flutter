import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_practice/provider/auth_provider.dart';

void main() {
  runApp(ProviderScope(child: const _App()));
}

class _App extends ConsumerWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      // URI string을 상태 및 go router에서 사용할 수 있는 형태로 변환해주는 함수
      routeInformationParser: router.routeInformationParser,

      // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수
      routerDelegate: router.routerDelegate,
    );
  }
}
