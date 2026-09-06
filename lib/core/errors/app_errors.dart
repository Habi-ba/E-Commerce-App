abstract class AppErrors {
  String error;
  AppErrors({required this.error});
}
class ServerError extends AppErrors{
  ServerError({String message ="Server Is Down , Please Try Again Later!"}):super(error: message);

}
class NetworkError extends AppErrors{
  NetworkError({String message ="No Internet Connection , Please Check Your Internet!"}):super(error: message);

}
class IgnoredError extends AppErrors{
  IgnoredError({String message =''}):super(error: message);

}
class UnknownError extends AppErrors{
  UnknownError({String message ='Something Went Wrong , Please Try Again Later!'}):super(error: message);

}
