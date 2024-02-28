import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  static SharedPreferences? sharedPreferences;

  static init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  // Future<MyServices> init() async {
  //   await Firebase.initializeApp();
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   return this;
  // }
}

initialServices() async {
  await Get.putAsync(() => MyServices.init());
}
