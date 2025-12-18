import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopper_app/src/config/route/router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Shopper App',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider).goRouter,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      themeMode: ThemeMode.system,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
