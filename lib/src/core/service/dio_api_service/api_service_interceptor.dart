import 'package:dio/dio.dart';
import 'package:shopper_app/src/config/app_config.dart';

class DioServiceInterceptor extends Interceptor {
  DioServiceInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request: ${options.method} ${options.path}');
    print('Headers: ${options..path}');
    print('url: ${options.baseUrl + options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}
}
