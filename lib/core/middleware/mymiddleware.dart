import 'package:breakfastcanteen/core/constant/routes.dart';
import 'package:breakfastcanteen/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (MyServices.sharedPreferences!.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homepage);
    }
    if (MyServices.sharedPreferences!.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
