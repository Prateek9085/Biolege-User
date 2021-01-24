import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:user/app/locator.dart';
import 'package:user/model/doctor.dart';
import 'package:user/services/services/dataFromApi_service.dart';
import '../../../services/services/api_service.dart';

class SortDoctorViewModel extends BaseViewModel {
  final APIServices _apiServices = locator<APIServices>();
  final NavigationService _navigatorService = locator<NavigationService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  List<Doctor> dslist = [];
  Map<String, List<Doctor>> spdsList;
  List<Doctor> results = [];
  List<Doctor> doctorsList = [];
//Map<String, ClinicElement> clinicDetailsOfDoctor;

  void getDoctorsList() async {
    setBusy(true);
    doctorsList = _dataFromApiService.getDoctorsList;
    //clinicDetailsOfDoctor = _dataFromApiService.getClinicDetailsOfDoctor;
    print(results);
    setBusy(false);
  }

  void cv(Doctor doc) {
    dslist.forEach((doc) => spdsList[doc.specialization.elementAt(1)].add(doc));
  }
}
