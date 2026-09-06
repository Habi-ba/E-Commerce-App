import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

@module
abstract class GetItModule {
  @lazySingleton
  BaseOptions get baseOptions => BaseOptions(baseUrl: ApiConstants.baseUrl);
  @lazySingleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    responseBody: true,
    responseHeader: true,
    requestHeader: true,
  );
  @lazySingleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @lazySingleton
  ApiClient get provideApiClient =>
      ApiClient(provideDio(baseOptions, prettyDioLogger));
  @lazySingleton
  Connectivity get provideConnectivity=>Connectivity();
}

