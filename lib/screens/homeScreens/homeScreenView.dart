import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:user/widgets/animations.dart';
import '../../app/size_configuration.dart';
import '../../theme/theme.dart';
import '../../widgets/reusables.dart';
import 'homeScreenViewModel.dart';
//import 'patientDetailsScreen/appointment_initial.dart';

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
          body: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 20,
              ),
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
                        'Appointment',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                      onTap: () {
                        print("tapped on text");
                      },
                    ),
                    InkWell(
                      child: Text(
                        'Pharmacy',
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
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.4),
                      blurRadius: 10,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Doctor \nAppointment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Nunito",
                              fontSize: 22,
                            ),
                          ),
                          SvgPicture.asset(
                            'asset/images/appointment.svg',
                            height: 170,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F6F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () => model.searchBar(),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.black12,
                            labelText:
                                'Search for doctors,specialist,hospitals,clinics etc',
                            labelStyle:
                                TextStyle(fontFamily: 'Nunito', fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Speciality",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AllSpecialist(),
                              //   ),
                              //);
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    //container("Cardiologist", "19 doctors"),
                    // ListView.builder(
                    //   itemBuilder: (ctx, index) => Text('Hello'),
                    //   scrollDirection: Axis.horizontal,
                    //   //shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   primary: false,
                    //   itemCount: 4,
                    //   // children: [
                    //   //   container("Cardiologist", "19 doctors"),
                    //   //   container("Neurologist", "10 doctors"),
                    //   //   container("Oncologist", "17 doctors"),
                    //   //   container("ENT", "17 doctors"),
                    //   // ],
                    // ),
                    // Container(
                    //   height: 140,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     shrinkWrap: true,
                    //     children: [
                    //       container("Cardiologist", "19 doctors"),
                    //       container("Neurologist", "10 doctors"),
                    //       container("Oncologist", "17 doctors"),
                    //       container("ENT", "17 doctors"),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      height: 140,

                      // child: ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   shrinkWrap: true,
                      //   children: [
                      //     container("", "HAMM"),
                      //     container("", "Dey Nursing"),
                      //     container("", "Star Care"),
                      //   ],
                      // ),
                      child: model.specialisationList.length != 0
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
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
                                          title: Text(
                                            model.specialisationList.keys
                                                    .elementAt(index)
                                                    .toString() +
                                                '\n\n',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          subtitle: Text(
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
                                  child: Text("No specialt to show"),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hospitals and Clinics",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AllHospitals(),
                              //   ),
                              // );
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 140,
                      // child: ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   shrinkWrap: true,
                      //   children: [
                      //     container("", "HAMM"),
                      //     container("", "Dey Nursing"),
                      //     container("", "Star Care"),
                      //   ],
                      // ),
                      child: model.clinicsList.length != 0
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              primary: false,
                              itemCount: model.clinicsList.length,
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
                                        onTap: () => model.clinicProfileView(
                                            model.clinicsList[index]),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                        title: CircleAvatar(
                                          radius: 25.0,
                                          // backgroundImage: NetworkImage(
                                          //     'https://via.placeholder.com/150'),
                                          backgroundColor: Colors.black12,
                                        ),
                                        subtitle: Text(
                                          model.clinicsList[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        // subtitle: Text(model
                                        //             .clinicsList[index]
                                        //             .phoneNumber
                                        //             .toString()
                                        //             .length !=
                                        //         0
                                        //     ? model.clinicsList[index]
                                        //             .phoneNumber
                                        //             .toString() ??
                                        //         ''
                                        //     : ''),
                                        // trailing: model.clinicDetailsOfDoctor
                                        //         .containsKey(
                                        //             model.results[index].id)
                                        //     ? Text("Already added",
                                        //         style: TextStyle(fontSize: 10))
                                        // trailing: Text(
                                        //   "Show info",
                                        //   style: TextStyle(fontSize: 10),
                                        // ),
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : Column(
                              children: [
                                Center(
                                  child: Text("No clinics to show"),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Doctors",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => DoctorPage(),
                              //   ),
                              // );
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Column(
                    //   children: [
                    //     Doccard("Dr Hemmant Singh Rathore", "Chest Specialist"),
                    //     Doccard("Dr Hemmant Singh Rathore", "Chest Specialist"),
                    //     Doccard("Dr Hemmant Singh Rathore", "Chest Specialist"),
                    //   ],
                    // ),
                    model.doctorsList.length != 0
                        ? ListView.builder(
                            primary: false,
                            itemCount: model.doctorsList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FadeInLTR(
                                0.1,
                                Card(
                                  // color: offWhite,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: white, width: 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    onTap: () => model.profileDescriptionView(
                                        model.doctorsList[index]),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    leading: CircleAvatar(
                                      radius: 25.0,
                                      // backgroundImage: NetworkImage(
                                      //     'https://via.placeholder.com/150'),
                                      backgroundColor: Colors.black12,
                                    ),
                                    title: Text(
                                      model.doctorsList[index].name,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    subtitle: Text(model.doctorsList[index]
                                                .specialization.length !=
                                            0
                                        ? model.doctorsList[index]
                                                .specialization[0] ??
                                            ''
                                        : ''),
                                    // trailing: model.clinicDetailsOfDoctor
                                    //         .containsKey(
                                    //             model.results[index].id)
                                    //     ? Text("Already added",
                                    //         style: TextStyle(fontSize: 10))
                                    trailing: Text(
                                      "Show info",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Column(
                            children: [
                              Center(
                                child: Text("No doctors to show"),
                              ),
                            ],
                          ),
                  ],
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
