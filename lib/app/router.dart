// This files contains all the routes of the app
// Simply add a Material Route Constructor with Classname and Routename
// and run the below command
// flutter pub run build_runner build --delete-conflicting-outputs
// _____________________________________________________________________________
import 'package:auto_route/auto_route_annotations.dart';
import 'package:user/screens/homeScreens/doctorsListTabScreens/clinicProfileScreen/clinicProfileScreenView.dart';
import 'package:user/screens/homeScreens/showAllScreen/showAllClinicScreen/showAllClinicsScreenView.dart';
import 'package:user/screens/homeScreens/showAllScreen/showAllDoctorsScreen/showAllDoctorsScreenView.dart';
import 'package:user/screens/homeScreens/showAllScreen/showAllSpecialityScreen/showAllSpecialityScreenView.dart';
import '../screens/rootView.dart';
import '../screens/addCustomerProfileScreens/addressScreen/addressScreenView.dart';
import '../screens/addCustomerProfileScreens/emailScreen/emailScreenView.dart';
import '../screens/addCustomerProfileScreens/genderScreen/genderScreenView.dart';
import '../screens/addCustomerProfileScreens/nameScreen/nameScreenView.dart';
import '../screens/onBoardingScreen/onBoardingScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import '../screens/homeScreens/doctorsListTabScreens/doctorsProfileScreen/doctorsProfileScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/confirmationScreen/confirmScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/timeAndDateSelectionScreen/timeAndDateSelectionScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardAddNameScreen/addBiolegeCardAddNameScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addBiolegeCardScreen/addBiolegeScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerDetailsScreen/addCustomerDetailsScreenView.dart';
import '../screens/homeScreens/addCustomerScreens/addCustomerScreen/addCustomerScreenView.dart';
import '../screens/homeScreens/customerDoctorSelectionScreen/customerDoctorSelectionScreenView.dart';
import '../screens/homeScreens/changeAppointmentDetailsScreen/changeAppointmentDetailsScreenView.dart';
import '../screens/homeScreens/patientDetailsScreen/patientDetailsScreenView.dart';
import '../screens/homeScreens/appointmentHomeScreen/appointmentHomeScreenView.dart';
import '../screens/homeScreens/homeScreenView.dart';
import '../screens/welcomeScreen/welcomeScreenView.dart';
import '../screens/signUpScreens/otpScreen/otpScreenView.dart';
import '../screens/signUpScreens/phoneNumberScreen/phoneScreenView.dart';
import '../screens/homeScreens/selectDoctorForClinicScreen/selectDoctorClinicScreen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  // ___________________________________________________________________________
  MaterialRoute(
    path: Root.routeName,
    page: Root,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: OnBoardingScreen.routeName,
    page: OnBoardingScreen,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: ClinicProfileScreenView.routeName,
    page: ClinicProfileScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: PhoneScreenView.routeName,
    page: PhoneScreenView,
  ),
  MaterialRoute(
    path: OTPScreenView.routeName,
    page: OTPScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: NameScreenView.routeName,
    page: NameScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: ShowAllDoctorsScreenView.routeName,
    page: ShowAllDoctorsScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: ShowAllClinicsScreenView.routeName,
    page: ShowAllClinicsScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: ShowAllSpecialityScreenView.routeName,
    page: ShowAllSpecialityScreenView,
  ),
  MaterialRoute(
    path: GenderScreenView.routeName,
    page: GenderScreenView,
  ),
  MaterialRoute(
    path: EmailScreenView.routeName,
    page: EmailScreenView,
  ),
  MaterialRoute(
    path: AddressScreenView.routeName,
    page: AddressScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: WelcomeScreenView.routeName,
    page: WelcomeScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: HomeScreenView.routeName,
    page: HomeScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: AppointmentHomeScreenView.routeName,
    page: AppointmentHomeScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: PatientDetailsScreenView.routeName,
    page: PatientDetailsScreenView,
  ),
  MaterialRoute(
    path: ChangeAppointmentDetailsScreenView.routeName,
    page: ChangeAppointmentDetailsScreenView,
  ),
  MaterialRoute(
    path: AddCustomerScreenView.routeName,
    page: AddCustomerScreenView,
  ),
  MaterialRoute(
    path: AddCustomerDetailsScreenView.routeName,
    page: AddCustomerDetailsScreenView,
  ),
  MaterialRoute(
    path: AddBiolegeScreenView.routeName,
    page: AddBiolegeScreenView,
  ),
  MaterialRoute(
    path: AddBiolegeCardAddNameScreenView.routeName,
    page: AddBiolegeCardAddNameScreenView,
  ),
  MaterialRoute(
    path: CustomerDoctorSelectionScreenView.routeName,
    page: CustomerDoctorSelectionScreenView,
  ),
  MaterialRoute(
    path: TimeAndDateSelectionScreenView.routeName,
    page: TimeAndDateSelectionScreenView,
  ),
  MaterialRoute(
    path: ConfirmScreenView.routeName,
    page: ConfirmScreenView,
  ),
  // ___________________________________________________________________________
  MaterialRoute(
    path: DoctorsListScreenView.routeName,
    page: DoctorsListScreenView,
  ),
  MaterialRoute(
    path: DoctorsProfileScreenView.routeName,
    page: DoctorsProfileScreenView,
  ),
  MaterialRoute(
    path: SelectDoctorClinicScreen.routeName,
    page: SelectDoctorClinicScreen,
  ),
  // ___________________________________________________________________________
])
class $Router {}
