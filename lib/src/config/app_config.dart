import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A service class for managing application configuration via environment variables.
///
/// The [AppConfig] class provides methods to load and access environment variables
/// from a `.env` file using the `flutter_dotenv` package.
class AppConfig {
  static Future<void> loadEnv() async {
    try {
      await dotenv.load(fileName: 'env/.env');
    } catch (e) {
      throw Exception('Failed to load .env file: $e');
    }
  }

  static String? getBaseUrl() {
    return dotenv.env['BASE_URL'];
  }
}
