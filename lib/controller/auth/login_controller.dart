import 'package:breakfastcanteen/core/class/statusrequest.dart';
import 'package:breakfastcanteen/core/constant/routes.dart';
import 'package:breakfastcanteen/core/functions/handingdatacontroller.dart';
import 'package:breakfastcanteen/core/services/services.dart';
import 'package:breakfastcanteen/data/datasource/remote/auth/general.dart';
import 'package:breakfastcanteen/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          if (response['data']['users_approve'] == "1") {
            MyServices.sharedPreferences!
                .setString("id", response['data']['users_id']);
            String userid = MyServices.sharedPreferences!.getString("id")!;
            MyServices.sharedPreferences!
                .setString("username", response['data']['users_name']);
            MyServices.sharedPreferences!
                .setString("email", response['data']['users_email']);
            MyServices.sharedPreferences!
                .setString("phone", response['data']['users_phone']);
            MyServices.sharedPreferences!.setString("step", "2");

            myVerificationCode = response['data']['users_verfiycode'];
            print('${myVerificationCode} THIS IS MYYYYYYYYYYYYYYYYY');
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            Get.offNamed(AppRoute.homepage);
          } else {
            Get.toNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
