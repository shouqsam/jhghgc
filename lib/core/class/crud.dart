import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:breakfastcanteen/core/class/statusrequest.dart';
import 'package:breakfastcanteen/core/functions/checkinternet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../constant/routes.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print('${data} -------------------------');

      if (response.statusCode == 200) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        Get.offNamed(AppRoute.homepage);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
