import 'dart:async';

import '../../../data/grocery/model/response/login_response.dart';
import '../repositories/login_repository.dart';

class LoginGrocery {
  final LoginRepository _loginRepository;

  LoginGrocery(this._loginRepository);

  FutureOr<LoginResponse>? loginGrocery(String? user, String? password) =>
      _loginRepository.loginGrocery(user, password);
}
