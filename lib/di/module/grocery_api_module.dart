import 'dart:async';

import 'package:configuration/data/data_source/local/sessions_pref.dart';
import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:dio/dio.dart';
import 'package:shoppbee/data/grocery/data_source/remote/grocery_api.dart';

class GroceryApiModule extends DIModule {
  @override
  provides() async {
    final dios = await setupX();
    // register api
    getIt.registerSingleton(
        GroceryApi(dios, baseUrl: 'https://4925-14-231-246-163.ngrok-free.app/s-cart/public/api/member/'));
  }

  static FutureOr<Dio> setupX() async {
    final options = BaseOptions(
      headers: {
        'User-Agent':'PostmanRuntime/7.28.4',
        'Accept':'*/*',
        'Authorization': 'Bearer ${SessionPref.getAccessTokenUser()}'
      },
      connectTimeout: Duration(seconds: 60),
      receiveTimeout:Duration(seconds: 60),
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "https://4925-14-231-246-163.ngrok-free.app/s-cart/public/api/member/",
    );
    final Dio dios = Dio(options);


    /// Print Log (production mode removal)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dios.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dios;
  }
}
