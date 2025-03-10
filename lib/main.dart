import 'dart:async';

import 'package:configuration/environment/env.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shoppbee/route/app_page.dart';
import 'package:shoppbee/route/app_route.dart';
import 'package:shoppbee/style/style.dart';

import 'data/grocery/data_source/local/attributes_product_local.dart';
import 'data/grocery/data_source/local/description_model_local.dart';
import 'data/grocery/data_source/local/image_model_local.dart';
import 'data/grocery/data_source/local/item_grocery_local.dart';
import 'data/grocery/data_source/local/list_item_grocery.dart';
import 'di/injection/injection.dart';

/// EndPoint default
void main() => Main();

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    Style.styleDefault();
    return Application();
  }

  @override
  Future? onInjection() async {
    final appDocDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocDirectory.path)
      ..registerAdapter(AttributesProductLocalAdapter())
      ..registerAdapter(DesCriptionModelLocalAdapter())
    ..registerAdapter(ImageModelLocalAdapter())
    ..registerAdapter(ItemGroceryLocalAdapter())
    ..registerAdapter(ListItemGroceryAdapter());
    await Injection.inject();
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context,child){
        return  GetMaterialApp(
          title: 'flutter architecture',
          initialRoute: AppRoutes.HOME,
          getPages: appPages,
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
