import 'dart:async';

import '../../../data/grocery/model/response/category_response/list_category.dart';
import '../repositories/login_repository.dart';



class GetListCategory {
  final LoginRepository _loginRepository;

  GetListCategory(this._loginRepository);

  FutureOr<ListCategory>? getListCategory() =>
      _loginRepository.getListCategory();
}
