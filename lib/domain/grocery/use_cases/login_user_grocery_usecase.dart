import 'dart:async';

import '../../../data/grocery/model/response/login_response.dart';
import '../repositories/grocery_repository.dart';



class LoginUserGroceryUseCase {
  final GroceryRepository _groceryRepository;

  LoginUserGroceryUseCase(this._groceryRepository);

  FutureOr<LoginResponse>? loginGroceryUser(String? user, String? password)=>_groceryRepository.loginGroceryUser(user, password);
}
