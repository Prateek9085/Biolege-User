import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/app/locator.dart';
import 'package:user/app/router.gr.dart';
import 'package:user/model/doctor.dart';
import 'package:user/services/services/dataFromApi_service.dart';
import 'package:user/services/services/helperData_service.dart';

class ShowAllDoctorsScreenViewModel extends FutureViewModel {

  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final NavigationService _navigatorService = locator<NavigationService>();
  final DoctorAppointments _doctorAppointments = locator<DoctorAppointments>();

  List<Doctor> doctorsList = [];

  void getDoctorsList() async {
    setBusy(true);
    doctorsList = _dataFromApiService.getDoctorsList;

    print(doctorsList);
    setBusy(false);
  }

  void profileDescriptionView(Doctor doctor) async {
    _doctorAppointments.setSelectedDoctorToShow(doctor);
    _navigatorService.navigateTo(Routes.doctorsProfileScreenView);
  }
  
  @override
  Future futureToRun() async {
    try {
      getDoctorsList();
    } catch (e) {
      print("Error." + e.toString());
    }
    throw UnimplementedError();
  }
}
