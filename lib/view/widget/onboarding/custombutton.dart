import 'package:flutter/material.dart';

import '../../screen/auth/login.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          color: Color.fromARGB(255, 54, 116, 80),
          child: const Text("Continue")),
    );
  }
}
