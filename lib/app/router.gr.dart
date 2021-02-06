// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../model/doctor.dart';
import '../screens/addCustomerProfileScreens/addressScreen/addressScreenView.dart';
import '../screens/addCustomerProfileScreens/emailScreen/emailScreenView.dart';
import '../screens/addCustomerProfileScreens/genderScreen/genderScreenView.dart';
import '../screens/addCustomerProfileScreens/nameScreen/nameScreenView.dart';
import '../screens/appointmentScreens/timeAndDateSelectionScreen/timeAndDateSelectionScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardAddNameScreen/addBiolegeCardAddNameScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardScreen/addBiolegeScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerDetailsScreen/addCustomerDetailsScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerScreen/addCustomerScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/confirmationScreen/confirmScreenView.dart';
import '../screens/homeScreens/appointmentHomeScreen/appointmentHomeScreenView.dart';
import '../screens/homeScreens/changeAppointmentDetailsScreen/changeAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/customerDoctorSelectionScreen/customerDoctorSelectionScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/clinicProfileScreen/clinicProfileScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../screens/homeScreens/homeScreenView.dart';
import '../screens/homeScreens/patientDetailsScreen/patientDetailsScreenView.dart';
import '../screens/homeScreens/selectDoctorForClinicScreen/selectDoctorClinicScreen.dart';
import '../screens/homeScreens/showAllScreen/showAllClinicScreen/showAllClinicsScreenView.dart';
import '../screens/homeScreens/showAllScreen/showAllDoctorsScreen/showAllDoctorsScreenView.dart';
import '../screens/homeScreens/showAllScreen/showAllSpecialityScreen/showAllSpecialityScreenView.dart';
import '../screens/onBoardingScreen/onBoardingScreenView.dart';
import '../screens/rootView.dart';
import '../screens/signUpScreens/otpScreen/otpScreenView.dart';
import '../screens/signUpScreens/phoneNumberScreen/phoneScreenView.dart';
import '../screens/welcomeScreen/welcomeScreenView.dart';

class Routes {
  static const String root = '/root';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String clinicProfileScreenView = '/clinicProfileScreenView';
  static const String phoneScreenView = '/phoneScreenView';
  static const String oTPScreenView = '/otpScreenView';
  static const String nameScreenView = '/nameScreenView';
  static const String showAllDoctorsScreenView = '/showAllDoctorsScreenView';
  static const String showAllClinicsScreenView = '/showAllClinicsScreenView';
  static const String showAllSpecialityScreenView =
      '/showAllSpecialityScreenView';
  static const String genderScreenView = '/genderScreenView';
  static const String emailScreenView = '/emailScreenView';
  static const String addressScreenView = '/addressScreenView';
  static const String welcomeScreenView = '/welcomeScreenView';
  static const String homeScreenView = '/homeScreenView';
  static const String appointmentHomeScreenView = '/appointmentHomeScreenView';
  static const String patientDetailsScreenView = '/patientDetailsScreenView';
  static const String changeAppointmentDetailsScreenView =
      '/changeAppointmentDetailsScreenView';
  static const String addCustomerScreenView = '/addCustomerScreen';
  static const String addCustomerDetailsScreenView =
      'addCustomerDetailsScreenView';
  static const String addBiolegeScreenView = '/addBiolegeScreenView';
  static const String addBiolegeCardAddNameScreenView =
      'addBiolegeCardAddNameScreenView';
  static const String customerDoctorSelectionScreenView =
      '/customerDoctorSelectionScreenView';
  static const String timeAndDateSelectionScreenView =
      '/timeAndDateSelectionScreenView';
  static const String confirmScreenView = '/confirmScreenView';
  static const String doctorsListScreenView = '/doctorsListScreenView';
  static const String doctorsProfileScreenView = '/doctorsProfileScreenView';
  static const String selectDoctorClinicScreen = '/selectDoctorClinicScreen';
  static const all = <String>{
    root,
    onBoardingScreen,
    clinicProfileScreenView,
    phoneScreenView,
    oTPScreenView,
    nameScreenView,
    showAllDoctorsScreenView,
    showAllClinicsScreenView,
    showAllSpecialityScreenView,
    genderScreenView,
    emailScreenView,
    addressScreenView,
    welcomeScreenView,
    homeScreenView,
    appointmentHomeScreenView,
    patientDetailsScreenView,
    changeAppointmentDetailsScreenView,
    addCustomerScreenView,
    addCustomerDetailsScreenView,
    addBiolegeScreenView,
    addBiolegeCardAddNameScreenView,
    customerDoctorSelectionScreenView,
    timeAndDateSelectionScreenView,
    confirmScreenView,
    doctorsListScreenView,
    doctorsProfileScreenView,
    selectDoctorClinicScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.root, page: Root),
    RouteDef(Routes.onBoardingScreen, page: OnBoardingScreen),
    RouteDef(Routes.clinicProfileScreenView, page: ClinicProfileScreenView),
    RouteDef(Routes.phoneScreenView, page: PhoneScreenView),
    RouteDef(Routes.oTPScreenView, page: OTPScreenView),
    RouteDef(Routes.nameScreenView, page: NameScreenView),
    RouteDef(Routes.showAllDoctorsScreenView, page: ShowAllDoctorsScreenView),
    RouteDef(Routes.showAllClinicsScreenView, page: ShowAllClinicsScreenView),
    RouteDef(Routes.showAllSpecialityScreenView,
        page: ShowAllSpecialityScreenView),
    RouteDef(Routes.genderScreenView, page: GenderScreenView),
    RouteDef(Routes.emailScreenView, page: EmailScreenView),
    RouteDef(Routes.addressScreenView, page: AddressScreenView),
    RouteDef(Routes.welcomeScreenView, page: WelcomeScreenView),
    RouteDef(Routes.homeScreenView, page: HomeScreenView),
    RouteDef(Routes.appointmentHomeScreenView, page: AppointmentHomeScreenView),
    RouteDef(Routes.patientDetailsScreenView, page: PatientDetailsScreenView),
    RouteDef(Routes.changeAppointmentDetailsScreenView,
        page: ChangeAppointmentDetailsScreenView),
    RouteDef(Routes.addCustomerScreenView, page: AddCustomerScreenView),
    RouteDef(Routes.addCustomerDetailsScreenView,
        page: AddCustomerDetailsScreenView),
    RouteDef(Routes.addBiolegeScreenView, page: AddBiolegeScreenView),
    RouteDef(Routes.addBiolegeCardAddNameScreenView,
        page: AddBiolegeCardAddNameScreenView),
    RouteDef(Routes.customerDoctorSelectionScreenView,
        page: CustomerDoctorSelectionScreenView),
    RouteDef(Routes.timeAndDateSelectionScreenView,
        page: TimeAndDateSelectionScreenView),
    RouteDef(Routes.confirmScreenView, page: ConfirmScreenView),
    RouteDef(Routes.doctorsListScreenView, page: DoctorsListScreenView),
    RouteDef(Routes.doctorsProfileScreenView, page: DoctorsProfileScreenView),
    RouteDef(Routes.selectDoctorClinicScreen, page: SelectDoctorClinicScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Root: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Root(),
        settings: data,
      );
    },
    OnBoardingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnBoardingScreen(),
        settings: data,
      );
    },
    ClinicProfileScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ClinicProfileScreenView(),
        settings: data,
      );
    },
    PhoneScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PhoneScreenView(),
        settings: data,
      );
    },
    OTPScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OTPScreenView(),
        settings: data,
      );
    },
    NameScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NameScreenView(),
        settings: data,
      );
    },
    ShowAllDoctorsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShowAllDoctorsScreenView(),
        settings: data,
      );
    },
    ShowAllClinicsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShowAllClinicsScreenView(),
        settings: data,
      );
    },
    ShowAllSpecialityScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShowAllSpecialityScreenView(),
        settings: data,
      );
    },
    GenderScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GenderScreenView(),
        settings: data,
      );
    },
    EmailScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EmailScreenView(),
        settings: data,
      );
    },
    AddressScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddressScreenView(),
        settings: data,
      );
    },
    WelcomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeScreenView(),
        settings: data,
      );
    },
    HomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreenView(),
        settings: data,
      );
    },
    AppointmentHomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppointmentHomeScreenView(),
        settings: data,
      );
    },
    PatientDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PatientDetailsScreenView(),
        settings: data,
      );
    },
    ChangeAppointmentDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChangeAppointmentDetailsScreenView(),
        settings: data,
      );
    },
    AddCustomerScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCustomerScreenView(),
        settings: data,
      );
    },
    AddCustomerDetailsScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCustomerDetailsScreenView(),
        settings: data,
      );
    },
    AddBiolegeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddBiolegeScreenView(),
        settings: data,
      );
    },
    AddBiolegeCardAddNameScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddBiolegeCardAddNameScreenView(),
        settings: data,
      );
    },
    CustomerDoctorSelectionScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerDoctorSelectionScreenView(),
        settings: data,
      );
    },
    TimeAndDateSelectionScreenView: (data) {
      final args = data.getArgs<TimeAndDateSelectionScreenViewArguments>(
        orElse: () => TimeAndDateSelectionScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TimeAndDateSelectionScreenView(
          doctor: args.doctor,
          clinicDetails: args.clinicDetails,
        ),
        settings: data,
      );
    },
    ConfirmScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ConfirmScreenView(),
        settings: data,
      );
    },
    DoctorsListScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DoctorsListScreenView(),
        settings: data,
      );
    },
    DoctorsProfileScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DoctorsProfileScreenView(),
        settings: data,
      );
    },
    SelectDoctorClinicScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectDoctorClinicScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// TimeAndDateSelectionScreenView arguments holder class
class TimeAndDateSelectionScreenViewArguments {
  final Doctor doctor;
  final ClinicElement clinicDetails;
  TimeAndDateSelectionScreenViewArguments({this.doctor, this.clinicDetails});
}
