import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:shoppbee/data/grocery/model/response/login_response.dart' show LoginResponse;

part 'grocery_api.g.dart';

@RestApi()
abstract class GroceryApi {
  factory GroceryApi(Dio dio, {String baseUrl}) = _GroceryApi;

  @POST('login')
  Future<LoginResponse> loginGroceryUser(
      @Query('email') String user, @Query('password') String password);
}
