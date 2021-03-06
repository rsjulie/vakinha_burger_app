import 'dart:async';
import 'dart:developer';
import 'package:vakinha_burger/app/core/exceptions/user_not_found_exception.dart';
import 'package:vakinha_burger/app/core/restClient/rest_client.dart';
import 'package:vakinha_burger/app/models/user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/dart-week/register.php', {
      'name': name,
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      var message = 'Erro ao registrar usuário!';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(message, error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/dart-week/login.php', {
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'Usuário o senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotFoundException();
      }
      log('Erro ao autenticar o usuário (${result.statusCode})',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException('Erro ao autenticar usuário');
    }
    if (result.statusCode == 204) {
      return UserModel.fromMap({
        'id': 1,
        'name': 'Julie',
        'email': email,
        'password': password,
      });
    }
    return UserModel.fromMap(result.body);
  }
}
