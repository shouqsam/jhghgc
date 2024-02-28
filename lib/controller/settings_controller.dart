import 'package:breakfastcanteen/core/constant/routes.dart';
import 'package:breakfastcanteen/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = MyServices.sharedPreferences!.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    MyServices.sharedPreferences!.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
