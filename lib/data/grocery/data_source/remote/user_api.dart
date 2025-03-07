import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/error_logger.dart';
import 'package:shoppbee/data/grocery/model/response/category_response/list_category.dart';
import 'package:shoppbee/data/grocery/model/response/login_response.dart';
import 'package:shoppbee/data/grocery/model/response/product_reponse/list_item_grocery.dart';
import 'package:retrofit/http.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;
  @GET('products')
  Future<ListItemGrocery?>? getListProduct();
  @POST('login')
  Future<LoginResponse> loginGrocery(@Query('username')String user,@Query('password') String password);

  @GET('brands')
  Future<ListCategory> getListCategory();
}
