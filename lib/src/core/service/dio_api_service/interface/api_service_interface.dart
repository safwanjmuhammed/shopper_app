// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

/// Interface for api services.
abstract interface class IApiService {
  const IApiService();

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  });

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  });

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  });

  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  });

  Future<Response> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  });

  /// For file upload. Using [FormData].
  Future<void> fileUpload(
    String path, {
    required FormData data,
    String method = PUT,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  });

  // HTTP methods
  static const GET = 'GET';
  static const POST = 'POST';
  static const PUT = 'PUT';
  static const PATCH = 'PATCH';
  static const DELETE = 'DELETE';
}
