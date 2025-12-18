import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shopper_app/src/config/app_config.dart';
import 'package:shopper_app/src/core/service/dio_api_service/api_service_interceptor.dart';
import 'package:shopper_app/src/core/service/dio_api_service/interface/api_service_interface.dart';

final dioApiService = Provider.autoDispose<IApiService>(
  (ref) => DioApiService(),
);

class DioApiService implements IApiService {
  /// Dio instance
  static Dio? dioInstance;

  /// Dio instance getter
  Dio get dio => dioInstance ??= _createDio();

  Dio _createDio() {
    return Dio(
      BaseOptions(baseUrl: AppConfig.getBaseUrl() ?? ''),
    )..interceptors.addAll([DioServiceInterceptor(), if (!kReleaseMode) ...[]]);
  }

  /// The [get], [post], [put] ,[patch] and [delete] methods will redirect throw this method.
  Future<Response> _request(
    String path, {
    required String method,
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool loader = true,
    Options? options,
  }) async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();

      final response = await dio.request(
        path,
        data: data,
        options: options ?? Options(method: method),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      return response;
    } on DioException catch (_) {
      throw Exception();
    } catch (err) {
      throw Exception();
    }
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  }) =>
      _request(
        path,
        method: IApiService.GET,
        queryParameters: queryParameters,
        loader: loader,
        cancelToken: cancelToken,
        options: options,
      );

  @override
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  }) =>
      _request(
        path,
        method: IApiService.POST,
        data: data,
        queryParameters: queryParameters,
        loader: loader,
        cancelToken: cancelToken,
        options: options,
      );

  @override
  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  }) =>
      _request(
        path,
        method: IApiService.PUT,
        data: data,
        queryParameters: queryParameters,
        loader: loader,
        cancelToken: cancelToken,
        options: options,
      );

  @override
  Future<Response> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  }) =>
      _request(
        path,
        method: IApiService.PATCH,
        data: data,
        queryParameters: queryParameters,
        loader: loader,
        cancelToken: cancelToken,
        options: options,
      );

  @override
  Future<Response> fileUpload(
    String path, {
    required FormData data,
    String method = IApiService.PUT,
    Map<String, dynamic>? queryParameters,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  }) =>
      _request(
        path,
        method: method,
        data: data,
        queryParameters: queryParameters,
        loader: loader,
        cancelToken: cancelToken,
        options: options,
      );

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool loader = true,
    CancelToken? cancelToken,
    Options? options,
  }) =>
      _request(
        path,
        data: data,
        method: IApiService.DELETE,
        queryParameters: queryParameters,
        loader: loader,
        cancelToken: cancelToken,
        options: options,
      );
}
