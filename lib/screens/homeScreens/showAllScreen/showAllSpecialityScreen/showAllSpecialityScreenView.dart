import 'package:user/app/size_configuration.dart';
import 'package:user/theme/theme.dart';

//import '../../../../../widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:user/widgets/animations.dart';

//import '../../../../../app/size_configuration.dart';
//import '../../../../../theme/theme.dart';
import 'showAllSpecialityScreenViewModel.dart';

class ShowAllSpecialityScreenView extends StatelessWidget {
  static const routeName = "/showAllSpecialityScreenView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowAllSpecialityScreenViewModel>.reactive(
      builder: (context, model, child) {
        return !model.isBusy
            ? Scaffold(
                // floatingActionButton: FloatingActionButton(
                //   onPressed: () => {},
                //   // model.navigateToAddDoctorToClinicScreen(),
                //   backgroundColor: white,
                //   child: Icon(Icons.add),
                // ),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Specialities",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        // Text(
                        //   model.data.length != 0
                        //       ? "To show doctor's appointment, select a doctor and swipe to appointments tab"
                        //       : "",
                        //   style: TextStyle(fontSize: 12, color: offBlack3),
                        // ),
                        model.specialisationList.length != 0
                          ? ListView.builder(
                              primary: false,
                              itemCount: model.specialisationList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FadeInLTR(
                                  0.1,
                                  Card(
                                    // color: offWhite,
                                    shape: RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: white, width: 0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                        width: getProportionateScreenWidth(200),
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          leading: Text(
                                            '\n' +
                                                model.specialisationList.keys
                                                    .elementAt(index)
                                                    .toString() +
                                                '\n',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          trailing: Text(
                                            model
                                                    .specialisationList[model
                                                        .specialisationList.keys
                                                        .elementAt(index)]
                                                    .length
                                                    .toString() +
                                                ' Doctors',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        )),
                                  ),
                                );
                              })
                          : Column(
                              children: [
                                Center(
                                  child: Text("No specialty to show"),
                                ),
                              ],
                            ),
                      ],
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
      disposeViewModel: false,
      // createNewModelOnInsert: true,
      viewModelBuilder: () => ShowAllSpecialityScreenViewModel(),
    );
  }
}
