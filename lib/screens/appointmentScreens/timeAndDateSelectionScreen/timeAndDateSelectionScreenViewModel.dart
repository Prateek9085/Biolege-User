import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:objectid/objectid.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/app/locator.dart';
import 'package:user/app/router.gr.dart';
import 'package:user/model/clinic.dart';
import 'package:user/services/services/api_service.dart';
import 'package:user/services/services/dataFromApi_service.dart';
import 'package:user/services/services/helperData_service.dart';

class TimeAndDateSelectionScreenViewModel extends FutureViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final APIServices _apiServices = locator<APIServices>();
  final PatientDetails _patientDetailservice = locator<PatientDetails>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  // _________________________________________________________________________
  // Controllers and Variables
  String timeSlotStartTime, timeSlotEndTime, timeSlotDay;
  TextEditingController date = TextEditingController();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateTime _firstDate = DateTime.now();
  DateTime get getFirstDate => _firstDate;
  DateTime _lastDate = DateTime.now().add(Duration(days: 7));
  DateTime get getLastDate => _lastDate;
  DateTime _selectedDate;
  DateTime get getselectedDate => _selectedDate;
  Map<String, Clinic> _clinics = {};
  Map<String, Clinic> get getClinicsById => _clinics;
  String selectedClinicId;

// _________________________________________________________________________
// Date picker
  void selectAssignedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: _firstDate,
        lastDate: _lastDate);

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      date.text = formatter.format(_selectedDate);
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    notifyListeners();
  }
// _________________________________________________________________________
// Time Slot setter

  void setTimeSlot(String startDate, String endDate, String day) {
    if (timeSlotDay == day) {
      timeSlotStartTime = null;
      timeSlotEndTime = null;
      timeSlotDay = null;
      notifyListeners();
      return;
    }
    timeSlotStartTime = startDate;
    timeSlotEndTime = endDate;
    timeSlotDay = day;
    notifyListeners();
  }

// _________________________________________________________________________
// Validators
  String validateDate() {
    return _selectedDate != null ? null : "Choose a date";
  }

  String validateTimeSlot() {
    return timeSlotStartTime != null ||
            timeSlotEndTime != null ||
            timeSlotDay != null
        ? null
        : "Choose a time slot";
  }

  // _________________________________________________________________________
  // Helper Functions
  void setAppointment() async {
    if (validateTimeSlot() != null) {
      _snackBarService.showSnackbar(message: validateTimeSlot());
      return;
    }
    if (validateDate() != null) {
      _snackBarService.showSnackbar(message: validateDate());
      return;
    }

    int wd;
    switch (timeSlotDay) {
      case "Monday":
        wd = 1;
        break;
      case "Tuesday":
        wd = 2;
        break;
      case "Wednesday":
        wd = 3;
        break;
      case "Thursday":
        wd = 4;
        break;
      case "Friday":
        wd = 5;
        break;
      case "Saturday":
        wd = 6;
        break;
      case "Sunday":
        wd = 7;
        break;
      default:
        wd = null;
        break;
    }

    if (wd == null) {
      _snackBarService.showSnackbar(message: "Something went wrong");
      return;
    }
    if (wd != null) if (_selectedDate.weekday != wd) {
      _snackBarService.showSnackbar(
          message: "The time slot and the selected day doesn't match");
      return;
    }
    _patientDetailservice.setDoctorsPatientSelectedDate(_selectedDate);
    _patientDetailservice.setAppointmentID(ObjectId().hexString);
    setBusy(true);
    await _apiServices.addOrUpdateDiagnosticCustomerToClinic(
        false, selectedClinicId);
    await _apiServices.addOrUpdateDiagnosticCustomersToDoctor(
        _patientDetailservice.getDoctorsPatientSelectedDoctor.id, false);
    await _apiServices.updateAppointmentInDiagnosticCustomer(selectedClinicId);
    //  Get all the clinics in the beginning itself
    await _dataFromApiService.setClinicsList();
    // Get all the doctors in the beginning itself
    await _dataFromApiService.setDoctorsList();
    // Get all the diagnotic customer in the beginning itself
    await _dataFromApiService.setDiagnosticCustomersList();
    await _dataFromApiService.setDoctorsListForClinic(selectedClinicId);
    setBusy(false);
    navigateToConfirm();
  }

  void navigateToConfirm() {
    _patientDetailservice.resetAllDoctorPatientVariable();
    _navigatorService.pushNamedAndRemoveUntil(Routes.confirmScreenView,
        predicate: ModalRoute.withName(Routes.homeScreenView));
  }

  @override
  Future futureToRun() async {
    try {
      _clinics = _dataFromApiService.getClinicsById;
    } catch (e) {}
    throw UnimplementedError();
  }
}
