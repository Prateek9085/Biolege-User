import '../../theme/theme.dart';
import 'package:flutter/material.dart';
import 'onBoardingItems.dart';

Widget buildOnBoardingScreen(
    BuildContext context, void Function() navigateToSignUp) {
  final pages = [
    SkOnboardingModel(
        title: '',
        description: 'Order lab test from Biolege app and get reports online\nFree home sample collection and report delivery',
        titleColor: Colors.transparent,
        descripColor: offBlack,
        imagePath: 'asset/images/1.png'),
    SkOnboardingModel(
        title: '',
        description: 'Book doctor\'s appointment sitting at home\nNo more standing in queue, get direct appointment',
        titleColor: Colors.transparent,
        descripColor: offBlack,
        imagePath: 'asset/images/2.png'),
    SkOnboardingModel(
        title: '',
        description: 'Order medicine from home\nGet lightning fast medicine delivery at your doorstep',
        titleColor: Colors.transparent,
        descripColor: offBlack,
        imagePath: 'asset/images/2.png'),
    SkOnboardingModel(
        title: '',
        description: 'Keep all your health recordsin one platform',
        titleColor: primaryColor,
        descripColor: offBlack,
        imagePath: 'asset/images/3.png'),
  ];

  return SKOnboardingScreen(
    bgColor: white,
    themeColor: primaryColor,
    pages: pages,
    getStartedClicked: (tapped) => navigateToSignUp(),
  );
}
