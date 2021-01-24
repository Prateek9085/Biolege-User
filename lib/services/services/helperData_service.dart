// Helper class used while creating a new doctor's patient
import 'dart:convert';
import '../../app/locator.dart';
import '../../model/clinic.dart';
import '../../model/clinicUser.dart';
import '../../model/doctor.dart';
import 'api_service.dart';
import 'dataFromApi_service.dart';
// import 'local_storage.dart';
// import 'package:stacked_services/stacked_services.dart';

class PatientDetails {
  // Locating the Dependencies
  final APIServices _apiServices = locator<APIServices>();
  // final StorageService _storageService = locator<StorageService>();
  // final NavigationService _navigatorService = locator<NavigationService>();
  // ___________________________________________________________________________
  // __________________________________________________________________________
  // Variables
  static String _doctorsPatientPhoneNumber;
  String getDoctorsPatientPhoneNumber() => _doctorsPatientPhoneNumber;
  void setDoctorsPatientPhoneNumber(String phone) =>
      _doctorsPatientPhoneNumber = phone;
  // ----------------------------------------------------------------
  static String _doctorsPatientName;
  String getDoctorsPatientName() => _doctorsPatientName;
  void setDoctorsPatientName(String name) => _doctorsPatientName = name;
  // ----------------------------------------------------------------
  static DateTime _doctorsPatientDob;
  DateTime getDoctorsPatientDob() => _doctorsPatientDob;
  void setDoctorsPatientDob(DateTime dob) => _doctorsPatientDob = dob;
  // ----------------------------------------------------------------
  static String _doctorsPatientGender;
  String getDoctorsPatientGender() => _doctorsPatientGender;
  void setDoctorsPatientGender(String gender) => _doctorsPatientGender = gender;
  // ----------------------------------------------------------------
  static int _doctorsPatientAge;
  int getDoctorsPatientAge() => _doctorsPatientAge;
  void setDoctorsPatientAge(int age) => _doctorsPatientAge = age;
  // ----------------------------------------------------------------  void setDoctorsPatientAge(int age) => _doctorsPatientAge = age;

  static String _doctorsPatientBloodGroup;
  String getDoctorsPatientBloodGroup() => _doctorsPatientBloodGroup;
  void setDoctorsPatientBloodGroup(String blood) =>
      _doctorsPatientBloodGroup = blood;
  // ----------------------------------------------------------------
  static String _doctorsPatientStateName;
  String getDoctorsPatientStateName() => _doctorsPatientStateName;
  void setDoctorsPatientStateName(String state) =>
      _doctorsPatientStateName = state;
  // ----------------------------------------------------------------
  static String _doctorsPatientCityName;
  String getDoctorsPatientCityName() => _doctorsPatientCityName;
  void setDoctorsPatientCityName(String city) => _doctorsPatientCityName = city;
  // ----------------------------------------------------------------
  static String _doctorsPatientPinCode;
  String getDoctorsPatientPinCode() => _doctorsPatientPinCode;
  void setDoctorsPatientPinCode(String pin) => _doctorsPatientPinCode = pin;
  // ----------------------------------------------------------------
  static String _doctorsPatientHomeAddress;
  String getDoctorsPatientHomeAddress() => _doctorsPatientHomeAddress;
  void setDoctorsPatientHomeAddress(String address) =>
      _doctorsPatientHomeAddress = address;
  // ----------------------------------------------------------------
  static String _doctorsPatientDiagnosticID;
  String getDoctorsPatientDiagnosticID() => _doctorsPatientDiagnosticID;
  void setDoctorsPatientDiagnosticID(String id) =>
      _doctorsPatientDiagnosticID = id;
  // ----------------------------------------------------------------
  static Doctor _doctorsPatientSelectedDoctor;
  Doctor getDoctorsPatientSelectedDoctor() => _doctorsPatientSelectedDoctor;
  void setDoctorsPatientSelectedDoctor(Doctor doc) =>
      _doctorsPatientSelectedDoctor = doc;
  // ----------------------------------------------------------------
  static DateTime _doctorsPatientSelectedDate;
  DateTime getDoctorsPatientSelectedDate() => _doctorsPatientSelectedDate;
  void setDoctorsPatientSelectedDate(DateTime dt) =>
      _doctorsPatientSelectedDate = dt;
  // __________________________________________________________________________
  // Helper Functions
  CustomerCustomer customerDetailsToBeSentIfDoesntExist() {
    return CustomerCustomer(id: _doctorsPatientDiagnosticID);
  }

  // ----------------------------------------------------------------
  // Prepare the data for sending to the Clinic and Doctor Object
  CustomerElement customerDetailsWithAppointmentDateObjectToBeSentIfDoesntExist(
      CustomerCustomer cs) {
    return CustomerElement(
      id: _doctorsPatientDiagnosticID,
      customer: cs,
      appointmentDate: [
        AppointmentDate(date: _doctorsPatientSelectedDate, isCompleted: 0)
      ],
    );
  }

  // ----------------------------------------------------------------
  String latestCustomersListToBeSent(List<CustomerElement> lce) {
    var object = [];
    lce.forEach((customer) => object.add(customer.toJson()));
    return jsonEncode({'customers': object});
  }

  // Future<bool> setDiagnosticCustomerFromDatabase() async {
  //   DiagnosticCustomer dgc = await _apiServices
  //       .getDiagnosticCustomerByPhone(_doctorsPatientPhoneNumber);

  //   if (dgc == null) return false;
  //   _doctorsPatientDiagnosticID = dgc.id;
  //   _doctorsPatientPhoneNumber = dgc.phoneNumber.toString();
  //   _doctorsPatientName = dgc.name;
  //   _doctorsPatientDob = dgc.dob;
  //   _doctorsPatientGender = dgc.gender;
  //   _doctorsPatientAge =
  //       (DateTime.now().difference(dgc.dob).inDays / 365).floor();
  //   _doctorsPatientBloodGroup = dgc.bloodGroup;
  //   _doctorsPatientStateName = dgc.address.state;
  //   _doctorsPatientCityName = dgc.address.city;
  //   _doctorsPatientPinCode = dgc.address.pincode.toString();
  //   _doctorsPatientHomeAddress = dgc.address.homeAddress;
  //   return true;
  // }

  // ----------------------------------------------------------------
  void resetAllDoctorPatientVariable() {
    _doctorsPatientPhoneNumber = null;
    _doctorsPatientName = null;
    _doctorsPatientDob = null;
    _doctorsPatientGender = null;
    _doctorsPatientAge = null;
    _doctorsPatientBloodGroup = null;
    _doctorsPatientStateName = null;
    _doctorsPatientCityName = null;
    _doctorsPatientPinCode = null;
    _doctorsPatientHomeAddress = null;
    _doctorsPatientSelectedDoctor = null;
    _doctorsPatientSelectedDate = null;
    _doctorsPatientDiagnosticID = null;
  }
  // __________________________________________________________________________
}

// Helper class used when creating a new doctor's customers
class DoctorAppointments {
  // __________________________________________________________________________
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  // __________________________________________________________________________
  // Variables and their setters

  static Doctor _selectedDoctorToShow;
  Doctor getSelectedDoctorToShow() => _selectedDoctorToShow;
  void setSelectedDoctorToShow(Doctor doc) {
    print(doc.name);
    _selectedDoctorToShow = doc;
  }

  static void Function() _refesh;
  void setRefreshAppointmentList(void Function() x) => _refesh = x;
  void Function() get getRefreshAppointmentList => _refesh;

  static DateTime _selectedDateInAppointmentTab;
  DateTime get getSelectedDateInAppointmentTab => _selectedDateInAppointmentTab;
  void setSelectedDateInAppointmentTab(DateTime dt) =>
      _selectedDateInAppointmentTab = dt;

  static ClinicElement _clinicDetailsForSelectedDoctorToShow;
  ClinicElement getClinicDetailsForSelectedDoctorToShow() =>
      _clinicDetailsForSelectedDoctorToShow;
  void setClinicDetailsForSelectedDoctorToShow(ClinicElement clielem) {
    _clinicDetailsForSelectedDoctorToShow = clielem;
  }

  static bool isFromClinic;
  bool getIsFromClinic() => isFromClinic;
  void setIsFromClinic(bool x) {
    print(x);
    isFromClinic = x;
  }

  static Doctor _selectedDoctor;
  Doctor getSelectedDoctor() => _selectedDoctor;
  void setSelectedDoctor(Doctor doc) {
    print("Selected Doctor for appointments tab : " + doc.name);
    _selectedDoctor = doc;
  }

  void setDefaultSelectedDoctor() {
    if (_dataFromApiService.getDoctorsListForClinic != null &&
        _dataFromApiService.getDoctorsListForClinic.length != 0)
      _selectedDoctor = _dataFromApiService.getDoctorsListForClinic[0];
  }

  // ----------------------------------------------------------------
  static DiagnosticCustomer _selectedDiagnosticCustomer;
  DiagnosticCustomer getSelectedDiagnosticCustomer() =>
      _selectedDiagnosticCustomer;
  void setSelectedDiagnosticCustomer(DiagnosticCustomer doc) {
    print("Selected Diagnostic Customer for appointments tab : " + doc.name);
    _selectedDiagnosticCustomer = doc;
  }

  // __________________________________________________________________________
}
