import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:user/main.dart';
import '../../widgets/animations.dart';

import '../../widgets/reusables.dart';
import '../../app/size_configuration.dart';
import 'welcomeScreenViewModel.dart';

class WelcomeScreenView extends StatelessWidget {
  static const routeName = "/welcomeScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                appBar: buildAppBar(context),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: SizeConfig.screenHeight * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(50),
                          ),
                          FadeInLTR(
                            0.3,
                            Text(
                              "Welcome to",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          FadeInLTR(
                            0.6,
                            Image.asset(
                              mainLogo,
                              height: getProportionateScreenHeight(30),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(50),
                          ),
                          FadeInLTR(
                            0.9,
                            Text(
                              model.data,
                              style: TextStyle(fontSize: 26),
                            ),
                          ),
                          Spacer(),
                          FadeInLTR(
                            1.5,
                            buildOutlineButton(
                                "Dashboard", model.navigateToHomePageView),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
      viewModelBuilder: () => WelcomeScreenViewModel(),
    );
  }
}
