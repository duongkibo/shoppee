import 'dart:async';

import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/interceptor/auth_interceptor.dart';
import 'package:configuration/network/interceptor/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shoppbee/data/grocery/data_source/remote/user_api.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setup();
    getIt.registerSingleton(dio);
    // register api
    getIt.registerSingleton(
        UserApi(dio, baseUrl: 'https://4925-14-231-246-163.ngrok-free.app/s-cart/public/api/admin/'));
  }

  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      headers: {
        'User-Agent':'PostmanRuntime/7.28.4',
        'Accept':'*/*'
      },
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "https://4925-14-231-246-163.ngrok-free.app/s-cart/public/api/admin/",
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    /// Adapt data (according to your own data structure, you can choose to add it)
    dio.interceptors.add(TokenInterceptor());

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    )
    );

    /// Print Log (production mode removal)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dio;
  }
}
