import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../app/size_configuration.dart';
import '../../theme/theme.dart';
import '../../widgets/reusables.dart';
import 'homeScreenViewModel.dart';
import 'patientDetailsScreen/appointment_initial.dart';

class HomeScreenView extends StatefulWidget {
  static const routeName = "/homeScreenView";
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              leadingWidth: SizeConfig.screenWidth / 3,
              leading: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  logoPath,
                  width: SizeConfig.screenWidth / 4.5,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Location",
                style: TextStyle(color: offBlack1, fontSize: 18),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(Icons.phone),
                      Text(
                        "Hojai\nCustomer Support",
                        style: TextStyle(color: offBlack2),
                      ),
                    ],
                  ),
                ),
              ]),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        'Diagonistic',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                      onTap: () {
                        print("tapped on text");
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Appoitment',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                      onTap: () {
                        print("tapped on text");
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Phermachy',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                      onTap: () {
                        print("tapped on text");
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Healthfeed',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                      onTap: () {
                        print("tapped on container");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        blurRadius: 10,
                      )
                    ],
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: AppointmentPage(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.getIndex,
            onTap: (selIndex) => model.setCurrentIndex(selIndex),
            iconSize: 18,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            selectedItemColor: primaryColor,
            unselectedItemColor: offBlack2,
            unselectedLabelStyle: TextStyle(color: offBlack2),
            items: model.items,
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}
