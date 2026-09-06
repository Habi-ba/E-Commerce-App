import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';

import '../models/request/login/login_request_dto.dart';

extension LoginRequestMappers on LoginRequest
{
  //عشان نحول من entity ل Dto
  LoginRequestDto toLoginRequestDto(){
    return LoginRequestDto(
        email: email,
        password: password
    );
  }
}