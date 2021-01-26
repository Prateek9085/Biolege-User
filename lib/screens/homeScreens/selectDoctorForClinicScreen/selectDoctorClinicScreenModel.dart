import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/model/clinic.dart';
import 'package:user/screens/homeScreens/doctorsListTabScreens/clinicProfileScreen/clinicProfileScreenView.dart';
import 'package:user/services/services/helperData_service.dart';
import '../../../model/doctor.dart';
import '../../../app/locator.dart';
import '../../../services/services/dataFromApi_service.dart';
import '../../../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';

// import '../../../model/clinic.dart';
// import '../../../model/clinicEmployee.dart';
// import '../../../services/services/auth_service.dart';
// import '../../../services/services/local_storage.dart';
// import 'package:user/services/services/api_service.dart';
class SelectDoctorClinicScreenViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final DoctorAppointments _doctorAppointments = locator<DoctorAppointments>();
  // final APIServices _apiServices = locator<APIServices>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // final StorageService _storageService = locator<StorageService>();
  // final Clinic _clinicDataService = locator<Clinic>();
  // final ClinicEmployee _clinicEmployeeDataService = locator<ClinicEmployee>();
  // final SnackbarService _snackBarService = locator<SnackbarService>();
  // __________________________________________________________________________
  // Controller and Variables
  TextEditingController searchedText = TextEditingController();
  final searchFormKey = GlobalKey<FormState>();
  List<Doctor> results = [];
  List<Clinic> results1 = [];
  List<Doctor> doctorsList = [];
  List<Clinic> clinicsList = [];
  Map<String, List<Doctor>> specialisationList = {};
  List<String> special = [];
  // Map<String, ClinicElement> clinicDetailsOfDoctor;
  // __________________________________________________________________________
  // Helper functions

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

  void search() {
    results.clear();
    results1.clear();
    special.clear();
    //print(doctorsList);
    doctorsList.forEach((doc) =>
        (doc.name.toLowerCase().contains(searchedText.text.toLowerCase()))
            ? results.add(doc)
            : null);

    clinicsList.forEach((cli) =>
        (cli.name.toLowerCase().contains(searchedText.text.toLowerCase()))
            ? results1.add(cli)
            : null);

    specialisationList.keys.forEach((spe) =>
        (spe.toLowerCase().contains(searchedText.text.toLowerCase()))
            ? special.add(spe)
            : null);

    if (searchedText.text.length == 0) {
      results.clear();
      results1.clear();
      special.clear();
    }
    print(results1);
    print(results);
    notifyListeners();
  }

  void profileDescriptionView(Doctor doctor) async {
    _doctorAppointments.setSelectedDoctorToShow(doctor);
    _navigatorService.navigateToView(DoctorsProfileScreenView());
  }

  void clinicProfileView(Clinic clinic) async {
    await _dataFromApiService.setDoctorsListForClinic(clinic.id);
    _dataFromApiService.setClinic(clinic);
    _navigatorService.navigateToView(ClinicProfileScreenView());
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
