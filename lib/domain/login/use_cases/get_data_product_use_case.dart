import 'dart:async';

import '../../../data/grocery/model/response/product_reponse/list_item_grocery.dart' show ListItemGrocery;
import '../repositories/login_repository.dart';

class GetDataProductUseCase {
  final LoginRepository _loginRepository;

  GetDataProductUseCase(this._loginRepository);

  FutureOr<ListItemGrocery> getDataProduct() =>
      _loginRepository.getDataProduct();
}
