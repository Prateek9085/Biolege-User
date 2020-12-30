import 'package:flutter/material.dart';

Column buildSplashContent(String mainLogo, String subLogo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        subLogo,
        height: 80,
      ),
      SizedBox(
        height: 30,
      ),
      Image.asset(
        mainLogo,
        height: 50,
      ),
      SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('LAB TEST'),
          Text('DOCTOR APPOINTMENT'),
          Text('MEDICINE'),
        ],
      ),
    ],
  );
}
