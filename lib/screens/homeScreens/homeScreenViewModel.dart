import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/app/locator.dart';
import 'package:user/app/router.gr.dart';
import 'package:user/model/clinic.dart';
import 'package:user/model/doctor.dart';
import 'package:user/services/services/dataFromApi_service.dart';
import 'package:user/services/services/helperData_service.dart';
import 'doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import 'appointmentHomeScreen/appointmentHomeScreenView.dart';

class HomeScreenViewModel extends FutureViewModel {
  final widgetOptions = [
    AppointmentHomeScreenView(),
    DoctorsListScreenView(),
    Text('Notification'),
    Text('Profile'),
  ];
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final NavigationService _navigatorService = locator<NavigationService>();
  final DoctorAppointments _doctorAppointments = locator<DoctorAppointments>();

  List<Doctor> doctorsList = [];
  List<Clinic> clinicsList = [];
  Map<String, List<Doctor>> specialisationList = {};

  void getDoctorsList() async {
    setBusy(true);
    doctorsList = _dataFromApiService.getDoctorsList;

    print(doctorsList);
    setBusy(false);
  }

  void getClinicsList() async {
    setBusy(true);
    clinicsList = _dataFromApiService.getAllClinics;

    print(clinicsList);
    setBusy(false);
  }

  void getSpecialisationList() async {
    setBusy(true);
    specialisationList = _dataFromApiService.getSpecialisationDoctors;

    print(specialisationList);
    setBusy(false);
  }

  int _index = 0;

  int get getIndex => _index;

  List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(MaterialIcons.assignment), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome5.lightbulb), label: 'Activities'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome.bell), label: 'Notifications'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome.user_circle), label: 'My Account'),
  ];

  void setCurrentIndex(int selIndex) {
    _index = selIndex;
    notifyListeners();
  }

  void searchBar() {
    _navigatorService.navigateTo(Routes.selectDoctorClinicScreen);
  }

  void profileDescriptionView(Doctor doctor) async {
    _doctorAppointments.setSelectedDoctorToShow(doctor);
    _navigatorService.navigateTo(Routes.doctorsProfileScreenView);
  }

  void clinicProfileView(Clinic clinic) async {
    await _dataFromApiService.setDoctorsListForClinic(clinic.id);
    _dataFromApiService.setClinic(clinic);
    _navigatorService.navigateTo(Routes.clinicProfileScreenView);
  }

  void navigateToShowAllDoctorsScreen() async {
    _navigatorService.navigateTo(Routes.showAllDoctorsScreenView);
  }

  void navigateToShowAllClinicsScreen() async {
    _navigatorService.navigateTo(Routes.showAllClinicsScreenView);
  }

  void navigateToShowAllSpecialityScreen() async {
    _navigatorService.navigateTo(Routes.showAllSpecialityScreenView);
  }

  @override
  Future futureToRun() async {
    try {
      getDoctorsList();
      getClinicsList();
      getSpecialisationList();
    } catch (e) {
      print("Error." + e.toString());
    }

    throw UnimplementedError();
  }
}
