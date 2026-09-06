import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/end_points.dart';
import 'package:e_commerce_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:e_commerce_app/features/auth/data/models/request/register/register_request_dto.dart';
import 'package:e_commerce_app/features/auth/data/models/response/auth_response_dto.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  @FactoryMethod()

  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST(EndPoints.signInApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);
  @POST(EndPoints.signUpApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
}

