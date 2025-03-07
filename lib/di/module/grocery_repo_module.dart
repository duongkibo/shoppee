import 'package:configuration/di/di_module.dart';
import 'package:shoppbee/data/grocery/data_source/remote/grocery_api.dart';
import 'package:shoppbee/data/grocery/repositories/grocery_repo.dart';


class GroceryRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<GroceryRepoImpl>(
            () => GroceryRepoImpl( getIt.get<GroceryApi>()));
  }
}
