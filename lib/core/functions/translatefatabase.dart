import 'package:breakfastcanteen/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (MyServices.sharedPreferences!.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
