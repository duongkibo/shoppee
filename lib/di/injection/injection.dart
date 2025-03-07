import 'package:shoppbee/di/module/api_module.dart';
import 'package:shoppbee/di/module/components_module.dart';
import 'package:shoppbee/di/module/grocery_api_module.dart';
import 'package:shoppbee/di/module/grocery_repo_module.dart';
import 'package:shoppbee/di/module/product_datasoure_module.dart';
import 'package:shoppbee/di/module/repo_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepoModule().provides();
    await ProductDatasourceModule().provides();
    await GroceryApiModule().provides();
    await GroceryRepoModule().provides();
  }
}
