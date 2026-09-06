import 'package:e_commerce_app/core/errors/app_errors.dart';

sealed class ApiResult<T> {
  bool get isSuccess => this is SuccessApiResult;
  bool get isError => this is ErrorApiResult;

  T? get getData => (this as SuccessApiResult).data;
  AppErrors  get getError => (this as ErrorApiResult).errorMessage;
}
class SuccessApiResult<T> extends ApiResult<T>{
  T? data;
  SuccessApiResult({required this.data});
}
class ErrorApiResult<T> extends ApiResult<T>{
 AppErrors errorMessage;
  ErrorApiResult({required this.errorMessage});
}