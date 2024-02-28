import 'package:breakfastcanteen/bindings/intialbindings.dart';
import 'package:breakfastcanteen/core/localization/translation.dart';
import 'package:breakfastcanteen/core/services/services.dart';
import 'package:breakfastcanteen/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAx2JzMP-QWD7IWOzIAyRCtpcsiIOJElpk",
        appId: "1:720420293560:android:7eab4c0ae29afd41d75d4d",
        messagingSenderId: "720420293560",
        projectId: "breakfastcanteen-c5c4c"),
  );
  Get.put(MyServices());
  await MyServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: '',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
