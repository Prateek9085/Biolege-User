import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/app/locator.dart';
import 'package:user/model/clinic.dart';
import 'package:user/screens/homeScreens/doctorsListTabScreens/clinicProfileScreen/clinicProfileScreenView.dart';
import 'package:user/services/services/dataFromApi_service.dart';

class ShowAllClinicsScreenViewModel extends FutureViewModel {

  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final NavigationService _navigatorService = locator<NavigationService>();

  List<Clinic> clinicsList = [];

  void getClinicsList() async {
    setBusy(true);
    clinicsList = _dataFromApiService.getAllClinics;
    setBusy(false);
  }

  void clinicProfileView(Clinic clinic) async {
    await _dataFromApiService.setDoctorsListForClinic(clinic.id);
    _dataFromApiService.setClinic(clinic);
    _navigatorService.navigateToView(ClinicProfileScreenView());
  }
  
  @override
  Future futureToRun() async {
    try {
      getClinicsList();
    } catch (e) {
      print("Error." + e.toString());
    }
    throw UnimplementedError();
  }
}
