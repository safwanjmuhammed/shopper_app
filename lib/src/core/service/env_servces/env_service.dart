import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A service class for loading and managing environment variables from a .env file.
///
/// This class provides methods to initialize and access environment variables
/// using the `flutter_dotenv` package. It ensures that the .env file is loaded
/// correctly and provides a convenient way to retrieve environment variables
/// with error handling.
///
/// Example:
/// ```dart
/// await EnvService.loadEnv();
/// String? apiKey = EnvService.get('API_KEY');
/// ```
class EnvService {
  /// Loads the .env file into the application's environment.
  ///
  /// This method asynchronously loads environment variables from the specified
  /// .env file using the `flutter_dotenv` package. The file is expected to be
  /// located at the path 'env/.env' relative to the project root.
  ///
  /// Throws an [Exception] if the .env file cannot be loaded due to file absence,

  static Future<void> loadEnv() async {
    try {
      await dotenv.load(fileName: 'env/.env');
    } catch (e) {
      throw Exception('Failed to load .env file: $e');
    }
  }

  /// Retrieves the value of an environment variable by its key.
  ///
  /// Returns the value associated with the provided [key] from the loaded
  /// environment variables. If the key does not exist, returns `null`.
  ///
  /// [key] The name of the environment variable to retrieve.
  ///
  /// Returns a [String] value of the environment variable, or `null` if the key
  /// is not found.
  ///
  /// Example:

  static String? get(String key) {
    return dotenv.env[key];
  }
}
