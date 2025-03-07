import 'dart:async';

import 'package:shoppbee/data/grocery/model/response/category_response/list_category.dart' show ListCategory;
import 'package:shoppbee/data/grocery/model/response/login_response.dart' show LoginResponse;

import '../../../data/grocery/model/response/product_reponse/list_item_grocery.dart' show ListItemGrocery;
import '../entities/auth_entity.dart' show AuthEntity;



abstract class LoginRepository{
  FutureOr<AuthEntity> login(String? user, String? password);
  FutureOr<ListItemGrocery> getDataProduct();
  FutureOr<LoginResponse> loginGrocery(String? user, String? password);
  FutureOr<ListCategory> getListCategory();
}