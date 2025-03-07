import 'dart:async';

import '../entities/auth_entity.dart' show AuthEntity;
import '../repositories/login_repository.dart';


class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  FutureOr<AuthEntity?>? login(String? user, String? password) =>
      _loginRepository.login(user, password);
}
