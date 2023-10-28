import 'package:dio/dio.dart';
import 'package:marvel/api/interceptor/authorization_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/default_interceptor.dart';

class DioBuilder {
  static const TIME_OUT = 5000;
  final String _url;
  final DefaultInterceptor _defaultInterceptor;
  final AuthorizationInterceptor _authorizationInterceptor;

  factory DioBuilder.create(
    String url,
    DefaultInterceptor defaultInterceptor,
    AuthorizationInterceptor authorizationInterceptor,
  ) {
    return DioBuilder(url, defaultInterceptor, authorizationInterceptor);
  }

  DioBuilder(
      this._url, this._defaultInterceptor, this._authorizationInterceptor);

  build() {
    final dio = Dio();
    dio.options.baseUrl = _url;
    dio.options.connectTimeout = TIME_OUT;
    dio.options.receiveTimeout = 5000;
    dio.interceptors.add(_defaultInterceptor);
    dio.interceptors.add(_authorizationInterceptor);
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }
}
