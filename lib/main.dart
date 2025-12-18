import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopper_app/src/app.dart';
import 'package:shopper_app/src/config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loadEnv();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> loadEnv() async {
  await AppConfig.loadEnv();
}
