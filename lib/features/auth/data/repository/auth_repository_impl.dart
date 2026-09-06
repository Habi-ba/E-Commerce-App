import 'package:e_commerce_app/core/errors/app_errors.dart';
import 'package:e_commerce_app/core/network/api_client.dart';
import 'package:e_commerce_app/core/network/api_result.dart';
import 'package:e_commerce_app/core/utils/connectivity_extentions.dart';
import 'package:e_commerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/features/auth/data/mappers/register_request_mapper.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../mappers/login_request_mappers.dart';
@Injectable(as:AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource _authRemoteDataSource;
  final Connectivity _connectivity;
  AuthRepositoryImpl({required this._authRemoteDataSource,required this._connectivity});

  @override
  Future<ApiResult<void>> login(LoginRequest loginRequest)async {

    if(await _connectivity.isConnected())
      {
        //todo: there is internet
        //todo : internet => remote ds
        //todo: LoginRequest=> LoginRequestDto=> Mappers
        var response=_authRemoteDataSource.login(loginRequest.toLoginRequestDto());
        return response;

      }
    else{
      //todo:there is no internet
      return ErrorApiResult(errorMessage: NetworkError());

    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest registerRequest) async{
    if(await _connectivity.isConnected())
    {
    //todo: there is internet
    //todo : internet => remote ds
    //todo: RegisterRequest=> RegisterRequestDto=> Mappers
    var response=_authRemoteDataSource.register(registerRequest.toRegisterRequestDto());
    return response;

    }
    else{
    //todo:there is no internet
    return ErrorApiResult(errorMessage: NetworkError());

    }
  }
}