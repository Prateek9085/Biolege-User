import 'package:user/app/size_configuration.dart';
import 'package:user/theme/theme.dart';

//import '../../../../../widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:user/widgets/animations.dart';

//import '../../../../../app/size_configuration.dart';
//import '../../../../../theme/theme.dart';
import 'showAllClinicsScreenViewModel.dart';

class ShowAllClinicsScreenView extends StatelessWidget {
  static const routeName = "/showAllClinicsScreenView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowAllClinicsScreenViewModel>.reactive(
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
                          "Clinics",
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
                        model.clinicsList.length != 0
                            ? ListView.builder(
                                primary: false,
                                itemCount: model.clinicsList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return FadeInLTR(
                                    0.2,
                                    Card(
                                      elevation: 0.3,
                                      // color: model.selectedDocID ==
                                      //         model.data[index].id
                                      //     ? offWhite1
                                      //     : white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: white, width: 0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        enabled: true,
                                        onTap: () =>
                                            model.clinicProfileView(
                                                model.clinicsList[index]),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                        leading: CircleAvatar(
                                          radius: 25.0,
                                          backgroundColor: Colors.black12,
                                        ),
                                        title: Text(
                                          model.clinicsList[index].name,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        subtitle: Text(model
                                                .clinicsList[index].phoneNumber
                                                .toString() ??
                                            ''),
                                        // trailing: InkWell(
                                        //   onTap: () =>
                                        //       model.profileDescriptionView(
                                        //           model.data[index]),
                                        //   child: Text(
                                        //     "Tap here to\nshow info",
                                        //     textAlign: TextAlign.center,
                                        //     style: TextStyle(fontSize: 9),
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                  );
                                })
                            : Center(
                                child: Text("No doctors to show"),
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
      viewModelBuilder: () => ShowAllClinicsScreenViewModel(),
    );
  }
}
