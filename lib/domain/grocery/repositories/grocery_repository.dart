import 'dart:async';

import '../../../data/grocery/model/response/login_response.dart';




abstract class GroceryRepository{

  FutureOr<LoginResponse>? loginGroceryUser(String? user, String? password);

}