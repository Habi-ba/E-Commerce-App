import 'package:e_commerce_app/core/network/api_result.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginScreenUseCase {
  final AuthRepository _authRepository;
  LoginScreenUseCase({required this._authRepository});
  Future<ApiResult<void>> call(LoginRequest loginRequest) {
    return _authRepository.login(loginRequest);
  }
}
